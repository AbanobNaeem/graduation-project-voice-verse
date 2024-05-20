import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:video_player/video_player.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

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

  void _togglePlayPause() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
      } else {
        _videoPlayerController.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isInitializing
        ? Center(child: const AnimatedLoadingWavingLine(color: primaryColorDark))
        : GestureDetector(
      onTap: _togglePlayPause,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            ),
          ),
          if (!_videoPlayerController.value.isPlaying)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.5),
              ),
              child: const  Icon(
                Icons.play_arrow_rounded,
                color: Colors.white30,
                size: 64.0,
              ),
            ),
        ],
      ),
    );
  }
}
