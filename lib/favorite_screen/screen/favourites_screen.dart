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
import 'package:voice_verse/common/app_component/list_of_videos.dart';
import 'package:voice_verse/favorite_screen/cubit/favorite_cubit.dart';
import 'package:voice_verse/home_screen/cubit/home_screen_cubit.dart';
import 'package:voice_verse/models/favorite_list.dart';
import 'package:voice_verse/shared/snack_bar.dart';
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
  FavoriteList? favoriteList;

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
            favoriteList = state.favoriteList;
          }
          if (state is GetFavoritesFailure) {
            CustomSnackBar.showError(context,
                message: state.errorMessage,
                title: "An error!!");
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
                  : favoriteList?.results?.videos?.isNotEmpty ?? false
                      ? SafeArea(
                          child: ListView.builder(
                              itemCount: favoriteList?.results?.videos?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                final video =
                                    favoriteList?.results?.videos?[index];
                                if (video == null) return const SizedBox();
                                return ListOfVideos(
                                    videoUrl: video.id?.video?.url ?? "",
                                    title: video.id?.title ?? "",
                                    description: video.id?.description ?? "",
                                    createdAt: video.id?.createdAt ?? "",
                                    onUnfavorite: (){
                                      cubit2.removeFromFavorites(id: favoriteList!.results!.id!);
                                      setState(() {
                                        favoriteList!.results!.videos!.removeAt(index);
                                      });
                                    },
                                    onDownload: (){
                                      FileDownloader
                                          .downloadFile(
                                        url: video.id!.video!.url!.toString(),
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
                                    onShare: ()async{
                                      final videoUrl =video.id!.video!.url!.toString();
                                      if (videoUrl.isNotEmpty) {
                                        await Share.share(
                                            videoUrl);
                                      } else {
                                        // Handle case where URL is empty
                                        print(
                                            'Empty video URL');
                                      }
                                    }
                                );
                              }),
                        )
                      : Padding(
                          padding: EdgeInsets.only(bottom: 50.h),
                          child: EmptyStateMessage(
                            imagePath: "images/icons/broken-heart.png",
                            mainText: "No favorites yet!",
                            subText:
                                "Like a recipe you see? save them here to your favourites.",
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


