import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/empty_state_message.dart';
import 'package:voice_verse/models/uploaded_videos_model.dart';
import 'package:voice_verse/uploaded_videos/cubit/uploaded_videos_cubit.dart';
import 'package:voice_verse/video_player_screen.dart';

class UploadedVideosScreen extends StatefulWidget {
  UploadedVideosScreen({super.key});

  @override
  State<UploadedVideosScreen> createState() => _UploadedVideosScreenState();
}

class _UploadedVideosScreenState extends State<UploadedVideosScreen> {
  final cubit = UploadedVideosCubit();
  UploadedVideosModel? uploadedVideosModel;
  double? _progress;

  @override
  void initState() {
    super.initState();
    cubit.getUploadedVideos(); // Ensure cubit fetches data on initialization
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocConsumer<UploadedVideosCubit, UploadedVideosStates>(
        listener: (context, state) {
          if (state is GetUploadedVideosSuccessState) {
            uploadedVideosModel = state.uploadedVideosModel;
          }
          if (state is GetUploadedVideosFailureState) {
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is GetUploadedVideosSuccessState || state is GetUploadedVideoLoadingState) {
            return Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(1.h),
                  child: Container(
                    color: secondColorDark,
                    height: 1.h,
                  ),
                ),
                backgroundColor: backGroundColorDark,
                centerTitle: true,
                title: Text(
                  "My Videos",
                  style: TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white60,
                  ),
                ),
              ),
              body: state is GetUploadedVideoLoadingState || _progress != null
                  ? const Center(
                child: AnimatedLoadingWavingLine(
                  color: primaryColorDark,
                ),
              )
                  : uploadedVideosModel?.results?.isNotEmpty ?? false
                  ? SafeArea(
                child: ListView.builder(
                  itemCount: uploadedVideosModel?.results?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return FutureBuilder<Uint8List?>(
                      future: VideoThumbnail.thumbnailData(
                        video: uploadedVideosModel?.results![index].video?.url ?? "",
                        imageFormat: ImageFormat.JPEG,
                        maxWidth: 100,
                        quality: 100,
                        timeMs: 1000,
                      ).then((value) => value ?? Uint8List(0)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPlayerScreen(
                                      videoUrl: uploadedVideosModel?.results![index].video?.url ?? "",
                                      titleOfVideo: uploadedVideosModel?.results![index].title ?? "",
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 30.w,
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                          image: MemoryImage(snapshot.data!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          uploadedVideosModel?.results![index].title ?? '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        Text(
                                          uploadedVideosModel?.results![index].description ?? '',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Text(
                                          uploadedVideosModel?.results![index].createdAt ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15.5.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: PopupMenuButton(
                                      color: Colors.white.withOpacity(0.7),
                                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                                        PopupMenuItem(
                                          value: 'download',
                                          onTap: () {
                                            FileDownloader.downloadFile(
                                              url: uploadedVideosModel!.results![index].video!.url!,
                                              onProgress: (name, progress) {
                                                setState(() {
                                                  _progress = progress;
                                                });
                                              },
                                              onDownloadCompleted: (value) {
                                                setState(() {
                                                  _progress = null;
                                                });
                                              },
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.download_rounded,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 2.w),
                                              Text(
                                                "Download",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          onTap: () async {
                                            final videoUrl = uploadedVideosModel!.results![index].video!.url!;
                                            if (videoUrl.isNotEmpty) {
                                              await Share.share(videoUrl);
                                            } else {
                                              print('Empty video URL');
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.share_rounded,
                                                color: Colors.black,
                                                size: 19.sp,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                "Share",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                          value: 'share',
                                        ),
                                      ],
                                      icon: Icon(
                                        Icons.more_horiz_rounded,
                                        color: Colors.white60,
                                        size: 25.sp,
                                      ),
                                      offset: const Offset(0, 0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else{
                          return const SizedBox();
                        }

                      },
                    );
                  },
                ),
              )
                  : Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: EmptyStateMessage(
                  imagePath: "images/icons/video-editor.png",
                  mainText: "No Uploaded videos yet!",
                  subText: "Share some videos and have fun!",
                  scale: 3,
                  color: Colors.white30,
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
