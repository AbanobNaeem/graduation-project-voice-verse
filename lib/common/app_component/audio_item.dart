import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class AudioItem extends StatefulWidget {
  final String title;
  final String description;
  final String audioUrl;

  const AudioItem({
    Key? key,
    required this.title,
    required this.description,
    required this.audioUrl,
  }) : super(key: key);

  @override
  _AudioItemState createState() => _AudioItemState();
}

class _AudioItemState extends State<AudioItem> {
  FlutterSoundPlayer? _audioPlayer;
  bool isPlaying = false;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = FlutterSoundPlayer();
    _audioPlayer?.openPlayer();
    _audioPlayer?.setSubscriptionDuration(const Duration(milliseconds: 10));
    _audioPlayer?.onProgress?.listen((event) {
      if (event != null && event.position.inMilliseconds >= event.duration.inMilliseconds) {
        setState(() {
          isPlaying = false;
          isFinished = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer?.closePlayer();
    _audioPlayer = null;
    super.dispose();
  }

  Future<void> _playPauseAudio() async {
    if (isPlaying) {
      await _audioPlayer?.pausePlayer();
    } else {
      if (isFinished) {
        await _audioPlayer?.stopPlayer();
        await _audioPlayer?.startPlayer(fromURI: widget.audioUrl);
        setState(() {
          isFinished = false;
        });
      } else {
        await _audioPlayer?.startPlayer(fromURI: widget.audioUrl);
      }
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 15.h , left: 5.w ,right: 5.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColorDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              InkWell(
                onTap: _playPauseAudio,
                child: Container(
                  width: 45.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: primaryColorDark,
                    size: 25.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
