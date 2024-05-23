import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/empty_state_message.dart';
import 'package:voice_verse/common/app_component/list_of_videos.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/favorite_screen/cubit/favorite_cubit.dart';
import 'package:voice_verse/models/favorite_list.dart';
import 'package:voice_verse/shared/snack_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final cubit = FavoriteCubit();
  double? _progress;
  FavoriteList? favoriteList;

  @override
  void initState() {
    super.initState();
    cubit.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
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

                      );
                    }),
              )
                  : Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: const EmptyStateMessage(
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

  void _updateFavoriteStatus(bool isLiked, String videoId) async {
    PreferenceUtils.instance.setBool(videoId, isLiked);
  }
}


