import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:voice_verse/video_player_screen.dart';

class ListOfVideos extends StatelessWidget {
  final String videoUrl;
  final String title;
  final String description;
  final String createdAt;


  const ListOfVideos({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: VideoThumbnail.thumbnailData(
        video: videoUrl,
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
                      videoUrl: videoUrl,
                      titleOfVideo: title,
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 110.w,
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
                 const  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          description,
                          style:const  TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          createdAt,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
