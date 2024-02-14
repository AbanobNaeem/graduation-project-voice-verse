// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:async';
//
// class VideoPlayerWidget extends StatefulWidget {
//   const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);
//   final String videoUrl;
//
//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }
//
// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _videoPlayerController;
//   late Future<void> _initializeVideoPlayerFuture;
//   bool _showButtons = false;
//
//
//   @override
//   void initState() {
//     _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
//     _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((value) {
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     super.dispose();
//   }
//
//   void _toggleButtonsVisibility() {
//     setState(() {
//       _showButtons = true;
//       Timer(const Duration(seconds: 5), () {
//         setState(() {
//           _showButtons = false;
//         });
//       });
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:const EdgeInsets.only(top:5, bottom:5 , right:5,left: 5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Trailer",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 20
//             ),
//           ),
//           const SizedBox(height: 10,),
//           FutureBuilder(
//             future: _initializeVideoPlayerFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return GestureDetector(
//                   onTap: _toggleButtonsVisibility,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(18),
//                         child: AspectRatio(
//                           aspectRatio: _videoPlayerController.value.aspectRatio,
//                           child: VideoPlayer(_videoPlayerController),
//                         ),
//                       ),
//                       Visibility(
//                         visible: _showButtons,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 int currentPosition = _videoPlayerController.value.position.inSeconds;
//                                 _videoPlayerController.seekTo(Duration(seconds: currentPosition - 5));
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.black.withOpacity(0.5),
//                                 ),
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Icon(
//                                   Icons.replay_5,
//                                   color: Colors.white70,
//                                   size: 30,
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 if (_videoPlayerController.value.isPlaying) {
//                                   _videoPlayerController.pause();
//                                 } else {
//                                   _videoPlayerController.play();
//                                 }
//                                 _toggleButtonsVisibility();
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.black.withOpacity(0.5),
//                                 ),
//                                 padding: const EdgeInsets.all(8),
//                                 child: Icon(
//                                   _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                                   color: Colors.white70,
//                                   size: 30,
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 int currentPosition = _videoPlayerController.value.position.inSeconds;
//                                 _videoPlayerController.seekTo(Duration(seconds: currentPosition + 5));
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.black.withOpacity(0.5),
//                                 ),
//                                 padding: const EdgeInsets.all(8),
//                                 child: const Icon(
//                                   Icons.forward_5,
//                                   color: Colors.white70,
//                                   size: 30,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key, required this.videoUrl, required this.thumbnail}) : super(key: key);
  final String videoUrl;
  final String thumbnail;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool _showButtons = false;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _toggleButtonsVisibility() {
    setState(() {
      _showButtons = true;
      Timer(const Duration(seconds: 5), () {
        setState(() {
          _showButtons = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Trailer",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GestureDetector(
                  onTap: _toggleButtonsVisibility,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      ),
                      Visibility(
                        visible: !_videoPlayerController.value.isPlaying,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            widget.thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _showButtons,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                int currentPosition = _videoPlayerController.value.position.inSeconds;
                                _videoPlayerController.seekTo(Duration(seconds: currentPosition - 5));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.replay_5,
                                  color: Colors.white70,
                                  size: 30,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_videoPlayerController.value.isPlaying) {
                                  _videoPlayerController.pause();
                                } else {
                                  _videoPlayerController.play();
                                }
                                _toggleButtonsVisibility();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                  color: Colors.white70,
                                  size: 30,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                int currentPosition = _videoPlayerController.value.position.inSeconds;
                                _videoPlayerController.seekTo(Duration(seconds: currentPosition + 5));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.forward_5,
                                  color: Colors.white70,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

