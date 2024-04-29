import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String titleOfVideo ;
  const VideoPlayerScreen({Key? key, required this.videoUrl, required this.titleOfVideo}) : super(key: key);

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
class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  bool _isInitializing = true; // Track the initialization state

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
      await _videoPlayerController.initialize();
      setState(() {
        _isInitializing = false;
      });
      _videoPlayerController.play(); // Start playing the video after initialization
    } catch (error) {
      print('Error initializing video player: $error');
      // Handle initialization error
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isInitializing ?
    const AnimatedLoadingWavingLine(color: primaryColorDark,)
        : AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),);
  }
}

