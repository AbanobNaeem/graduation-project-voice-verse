import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/video_player_widget.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String titleOfVideo ;
  const VideoPlayerScreen({
    Key? key,
    required this.videoUrl,
    required this.titleOfVideo }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.2.h),
          child: Container(
            color: secondColorDark,
            height: 0.1.h,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          titleOfVideo,
          style: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
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
      body: Padding(
        padding:  EdgeInsets.only(bottom: 5.h),
        child: Center(child: VideoPlayerWidget(videoUrl: videoUrl),),
      ),
    );
  }
}


