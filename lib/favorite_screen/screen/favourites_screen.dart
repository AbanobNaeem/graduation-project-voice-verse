import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/empty_state_message.dart';
import 'package:voice_verse/favorite_screen/cubit/favorite_cubit.dart';
import 'package:voice_verse/home_screen/cubit/home_screen_cubit.dart';
import 'package:voice_verse/models/favorite_list.dart';
import 'package:voice_verse/video_player_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final cubit1 = FavoriteCubit();
  final cubit2 = HomeScreenCubit();
  double? _progress;
  FavoriteList? favorites;

  @override
  void initState() {
    super.initState();
    cubit1.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => cubit1,
        ),
        BlocProvider(
          create: (context) => cubit2,
        ),
      ],
      child: BlocConsumer<FavoriteCubit, FavoritesStates>(
        listener: (context, state) {
          if (state is GetFavoritesSuccess) {
            favorites = state.favoriteList;
          }
          if (state is GetFavoritesFailure) {
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is GetFavoritesSuccess || state is GetFavoritesLoading) {
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
                  "My Favorites",
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
              body: state is GetFavoritesLoading || _progress != null
                  ? const Center(
                      child: AnimatedLoadingWavingLine(
                        color: primaryColorDark,
                      ),
                    )
                  : favorites?.results?.videos?.isNotEmpty ?? false
                      ? SafeArea(
                          child: ListView.builder(
                            itemCount: favorites?.results?.videos?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return FutureBuilder<Uint8List?>(
                                future: VideoThumbnail.thumbnailData(
                                  video:
                                      favorites?.results?.videos?[index].url ??
                                          '',
                                  // Provide a default value for the video URL
                                  imageFormat: ImageFormat.JPEG,
                                  maxWidth: 100,
                                  quality: 100,
                                  timeMs:
                                      1000, // Time in milliseconds for the second frame
                                ).then((value) => value ?? Uint8List(0)),
                                // Convert nullable Uint8List? to non-nullable Uint8List
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoPlayerScreen(
                                                videoUrl: favorites?.results
                                                        ?.videos?[index].url ??
                                                    '',
                                                titleOfVideo: favorites
                                                        ?.results
                                                        ?.videos?[index]
                                                        .id
                                                        ?.title ??
                                                    '',
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
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  image: DecorationImage(
                                                    image: MemoryImage(
                                                        snapshot.data!),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    favorites
                                                            ?.results
                                                            ?.videos?[index]
                                                            .id
                                                            ?.title ??
                                                        '',
                                                    // Provide a default value for the title
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    favorites?.results?.videos?[index].id?.description ?? '',
                                                    // Provide a default value for the description
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    favorites
                                                            ?.results
                                                            ?.videos?[index]
                                                            .id
                                                            ?.createdAt ??
                                                        '',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    onTap: () {
                                                      cubit2.removeFromFavorites(videoUrl: favorites!.results!.videos![index].url!,);
                                                      setState(() {
                                                        favorites!.results!.videos!.removeAt(index);
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.favorite_rounded,
                                                          color: Colors.black,
                                                          size: 19.sp,
                                                        ),
                                                        SizedBox(width: 5.w),
                                                        // Adjust the width as needed
                                                        Text(
                                                          "Unfavorite ",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    value: 'un favorite ',
                                                  ),
                                                  PopupMenuItem(
                                                    value: 'download',
                                                    onTap: () {
                                                      FileDownloader
                                                          .downloadFile(
                                                        url: favorites!
                                                            .results!
                                                            .videos![index]
                                                            .url!,
                                                        onProgress:
                                                            (name, progress) {
                                                          setState(() {
                                                            _progress =
                                                                progress;
                                                          });
                                                        },
                                                        onDownloadCompleted:
                                                            (value) {
                                                          setState(() {
                                                            _progress = null;
                                                          });
                                                        },
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .download_rounded,
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(width: 2.w),
                                                        // Adjust the width as needed
                                                        Text(
                                                          "Download",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    onTap: () async {
                                                      // Get the video URL from your API response
                                                      final videoUrl =
                                                          favorites!
                                                              .results!
                                                              .videos![index]
                                                              .url!;
                                                      if (videoUrl.isNotEmpty) {
                                                        await Share.share(
                                                            videoUrl);
                                                      } else {
                                                        // Handle case where URL is empty
                                                        print(
                                                            'Empty video URL');
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
                                                        // Adjust the width as needed
                                                        Text(
                                                          "share",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                offset: const Offset(0,
                                                    0), // Adjust the offset as needed
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
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
                              imagePath: "images/icons/broken-heart.png",
                              mainText: "No favorites yet!",
                              subText:
                                  "Like a recipe you see? save them here to your favourites."),
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
