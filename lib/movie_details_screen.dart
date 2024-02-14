import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_component/movie_details/movie_details_buttons/exit_button.dart';
import 'package:voice_verse/common/app_component/movie_details/movie_details_buttons/watch_movie_button.dart';
import 'package:voice_verse/common/app_component/movie_details/movie_details_widgets/cast_and_crew_widget.dart';
import 'package:voice_verse/common/app_component/movie_details/movie_details_widgets/movie_comments_widget.dart';
import 'package:voice_verse/common/app_component/movie_details/movie_details_widgets/movie_description.dart';
import 'package:voice_verse/common/app_component/movie_details/movie_details_widgets/movie_name_and_rating.dart';
import 'package:voice_verse/common/app_component/movie_details/movie_details_widgets/movie_tag_widget.dart';
import 'package:voice_verse/common/app_component/movie_details/movie_details_widgets/video_player.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';
import 'package:voice_verse/movie_model.dart';

class MovieDetails extends StatelessWidget {
  final List<MovieModel> movieList;
  int index;

  MovieDetails({super.key, required this.movieList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              movieList[index].imageAssets!,
                            ),
                            fit: BoxFit.cover,
                          ),
                      
                        ),
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              backGroundColor,
                              backGroundColor.withOpacity(0.2),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      CustomCircleButton(
                          onPressed: (){},
                          iconButton: Icons.favorite,
                          buttonColor: Colors.white,
                          iconColor: buttonColor,
                          opacity: 0.7,
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieNameAndRating(
                            movieName: movieList[index].movieName!,
                            year: movieList[index].year!,
                            movieRating: movieList[index].movieRating!,
                        ),
                        MovieTags(tags: movieList[index].tags!),
                        MovieDescription(description: movieList[index].description! ),
                        CastAndCrewWidget(casts: movieList[index].cast!),
                        VideoPlayerWidget(videoUrl: movieList[index].trailer!, thumbnail: 'images/genres_images/geners3.jpg',),
                        CommentCardWidget(comments: movieList[index].comments!),
                        SizedBox(height: MediaQuery.of(context).size.height *0.11,)
                      ],
                    ),
                  )

                ],
              ),
            ),
            PositionedButton(
                onPressed: (){},
                text:"Watch Movie"),
            CustomCircleButton(onPressed: (){Navigator.pop(context);})
          ],
        ),);
  }

}
