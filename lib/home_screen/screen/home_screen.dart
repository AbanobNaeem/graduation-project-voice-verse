import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:like_button/like_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';
import 'package:video_player/video_player.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/reel_details.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/home_screen/cubit/home_screen_cubit.dart';
import 'package:voice_verse/models/reels_data_model.dart';
import 'package:voice_verse/models/user_data_model.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/upload_video/screen/upload_video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ReelsDataModel? videoData;
  final cubit = HomeScreenCubit();
  late List<VideoPlayerController> _videoControllers;
  late List<bool> _videoLoading;
  late Timer _timer = Timer(Duration.zero, () {});
  bool _showControls = false;
  int _currentIndex = 0; // Track the current video index
  double _seekPosition = 0.0;
  double? _progress;

  @override
  void initState() {
    super.initState();
    cubit.getReelsData();
  }

  @override
  void dispose() {
    super.dispose();
    _videoControllers.forEach((controller) {
      controller.dispose();
    });
    _timer.cancel();
  }

  void _showControlsForFiveSeconds() {
    if (mounted) {
      setState(() {
        _showControls = true;
      });

      _timer = Timer(const Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            _showControls = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final controller = _videoControllers[_currentIndex];
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
        _showControlsForFiveSeconds();
      },
      child: BlocProvider(
            create: (_) => cubit,
        child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
          listener: (context, state) {
            if (state is GetVideosSuccessState) {
              setState(() {
                videoData = state.reel;
                _videoControllers = List.generate(
                  videoData!.results!.length,
                  (index) => VideoPlayerController.network(
                      videoData!.results![index].url!),
                );
                for (var controller in _videoControllers) {
                  controller.initialize().then((_) {
                    setState(() {}); // Force rebuild to reflect changes
                  });
                }
                _videoLoading = List.filled(videoData!.results!.length, false);
              });
            }
            if (state is GetVideoFailureState) {
              CustomSnackBar.showError(context,
                  message: 'Failed to fetch videos', title: "Failed");
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                centerTitle: false,
                backgroundColor: Colors.transparent,
                title: Text(
                  "Reels",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: PopupMenuButton<String>(
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem<String>(
                            value: 'camera',
                            child: Row(
                              children: [
                                Icon(Icons.camera_alt_rounded,
                                    color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Camera',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'gallery',
                            child: Row(
                              children: [
                                Icon(Icons.video_library, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                      onSelected: (String choice) {
                        if (choice == 'camera') {
                          openCamera(context);
                        } else if (choice == 'gallery') {
                          pickVideoFromGallery(context);
                        }
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                        size: 21,
                      ),
                      offset: const Offset(0, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              extendBodyBehindAppBar: true,
              body: _buildBody(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (videoData == null) {
      return const Center(
        child: AnimatedLoadingWavingLine(
          color: primaryColorDark,
        ),
      );
    } else {
      return PageView.builder(
        itemCount: videoData!.results!.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final VideoPlayerController controller = _videoControllers[index];
          controller.addListener(() {
            if (controller.value.position == controller.value.duration) {
              controller.seekTo(Duration.zero);
              controller.play();
            }
          });
          return Stack(
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              ),
              _videoLoading[index]
                  ? const Center(
                      child: AnimatedLoadingWavingLine(color: Colors.white),
                    )
                  : const SizedBox.shrink(),
              _showControls
                  ? Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle),
                        child: IconButton(
                          iconSize: 26.sp,
                          icon: Icon(
                            controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white60,
                          ),
                          onPressed: () {
                            if (controller.value.isPlaying) {
                              controller.pause();
                            } else {
                              controller.play();
                            }
                            _showControlsForFiveSeconds();
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                    begin: const Alignment(0, -0.75),
                    end: const Alignment(0, 0.1),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                    end: const Alignment(0, -0.75),
                    begin: const Alignment(0, 0.1),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 12,
                        child: ReelDetails(
                            userImage: videoData!.results![index].user?.profileImage!.url ??"",
                            userName:
                                videoData!.results![index].user?.userName ?? "",
                            description:
                                videoData!.results![index].description ?? ""),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            LikeButton(
                              isLiked: videoData!.results![index].isFavorite,
                              onTap: (isLiked) async {
                                final String videoUrl = videoData!.results![index].url!;
                                final bool isFavorite = videoData!.results![index].isFavorite;
                                final bool snapshotData = await _getFavoriteStatus(videoUrl); // Fetch favorite status directly
                                if (isFavorite || snapshotData == true) {
                                  await cubit.removeFromFavorites(videoUrl: videoUrl);
                                  videoData!.results![index].isFavorite = false;
                                  _updateFavoriteStatus(false, videoUrl); // Save disliked status
                                } else {
                                  await cubit.addToFavorites(
                                      videoUrl: videoUrl);
                                  videoData!.results![index].isFavorite = true;
                                  _updateFavoriteStatus(
                                      true, videoUrl); // Save liked status
                                }

                                return !isLiked;
                              },
                              likeBuilder: (bool isLiked) {
                                return FutureBuilder<bool>(
                                  future: _getFavoriteStatus(
                                      videoData!.results![index].url!),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Icon(
                                        Icons.favorite_rounded,
                                        color: isLiked || snapshot.data!
                                            ? Colors.red
                                            : Colors.white,
                                        size: 25.sp,
                                      );
                                    } else {
                                      return const CircularProgressIndicator(); // Placeholder until data is loaded
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 3.h),
                            _progress != null
                                ? SizedBox(
                                    width: 6.w,
                                    height: 3.h,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      FileDownloader.downloadFile(
                                          url: videoData!.results![index].url!,
                                          onProgress: (name, progress) {
                                            setState(() {
                                              _progress = progress;
                                            });
                                          },
                                          onDownloadCompleted: (value) {
                                            setState(() {
                                              _progress = null;
                                            });
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.download_rounded,
                                      color: Colors.white,
                                    ),
                                    iconSize: 25.sp,
                                  ),
                            SizedBox(height: 2.h),
                            IconButton(
                              onPressed: () async {
                                // Get the video URL from your API response
                                final videoUrl =
                                    videoData!.results![index].url!;
                                if (videoUrl.isNotEmpty) {
                                  await Share.share(videoUrl);
                                } else {
                                  // Handle case where URL is empty
                                  print('Empty video URL');
                                }
                              },
                              icon: const Icon(
                                Icons.share_rounded,
                                color: Colors.white,
                              ),
                              iconSize: 23.sp,
                            ),
                            SizedBox(height: 3.h),
                            Container(
                              height: 5.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.3.w,
                                ),
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: getProfileImageUrl() != null
                                      ? NetworkImage(getProfileImageUrl()!)
                                      : const AssetImage("images/logo.png")
                                          as ImageProvider<Object>,
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SmoothVideoProgress(
                    controller: controller,
                    builder: (context, progress, duration, child) {
                      final bool isPaused = !controller.value.isPlaying;
                      final double trackHeight = isPaused ? 4 : 1;
                      return SliderTheme(
                        data: SliderThemeData(
                          trackHeight: trackHeight,
                          inactiveTrackColor: Colors.transparent,
                          activeTrackColor: Colors.white38,
                          thumbColor: Colors.white60,
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: isPaused ? 3 : 1),
                          overlayShape:
                              SliderComponentShape.noOverlay, // Remove padding
                        ),
                        child: Slider(
                          value: progress.inMilliseconds.toDouble(),
                          min: 0,
                          max: duration.inMilliseconds.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              _seekPosition = value;
                            });
                          },
                          onChangeEnd: (value) {
                            controller.seekTo(
                                Duration(milliseconds: _seekPosition.toInt()));
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      );
    }
  }

  getCachedUserData() {
    String? userDataJson = PreferenceUtils.instance.getString("userData");
    if (userDataJson != null) {
      return UserDataModel.fromJson(json.decode(userDataJson));
    }
    return null;
  }

  getProfileImageUrl() {
    UserDataModel? userData = getCachedUserData();
    if (userData != null && userData.result?.profileImage?.url != null) {
      return userData.result?.profileImage?.url; // Accessing the URL
    }
    return null;
  }

  void _updateFavoriteStatus(bool isLiked, String videoUrl) async {
    PreferenceUtils.instance.setBool(videoUrl, isLiked);
  }

  Future<bool> _getFavoriteStatus(String videoUrl) async {
    return PreferenceUtils.instance.getBool(videoUrl) ?? false; // Return false if not found
  }}

  Future<void> openCamera(BuildContext context) async {
  final picker = ImagePicker();
  final pickedVideo = await picker.pickVideo(source: ImageSource.camera);

  if (pickedVideo != null) {
    // If a video is picked, navigate to a screen to display or process it
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadVideo(videoUrl: pickedVideo.path),
      ),
    );
  }
}

Future<void> pickVideoFromGallery(BuildContext context) async {
  final picker = ImagePicker();
  final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);

  if (pickedVideo != null) {
    // If a video is picked from the gallery, navigate to a screen to display or process it
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadVideo(videoUrl: pickedVideo.path),
      ),
    );
  }
}
