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
import 'package:voice_verse/common/app_component/list_of_videos.dart';
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
          if (state is GetUploadedVideosSuccessState ||
              state is GetUploadedVideoLoadingState) {
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
                              itemCount:uploadedVideosModel?.results?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                final video =  uploadedVideosModel?.results![index];
                                if (video == null) return const SizedBox();
                                return ListOfVideos(
                                    videoUrl: video.video!.url ??'',
                                    title: video.title ?? '',
                                    description: video.description ?? '',
                                    createdAt: video.createdAt ?? '',
                                    onDownload: (){
                                      FileDownloader
                                          .downloadFile(
                                        url: video.video!.url!.toString(),
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
                                      final videoUrl =video.video!.url!.toString();
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
