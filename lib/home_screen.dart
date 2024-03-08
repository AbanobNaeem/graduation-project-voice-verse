import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/reel_details.dart';
import 'package:voice_verse/common/app_component/reel_side_action_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: PageView.builder(
           itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder:(context , index){
              return Container(
                decoration:   BoxDecoration(
                  border: Border.all(color: backGroundColorDark),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image:AssetImage("images/movie_images/fast_furious.jpg"))
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.transparent
                            ],
                          begin: const Alignment(0,-0.75),
                          end: const Alignment(0,0.1)
                        )
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent
                              ],
                              end: Alignment(0,-0.75),
                              begin: Alignment(0,0.1)
                          )
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 13,
                              child: ReelDetails()
                            ),
                            Flexible(
                              flex: 2,
                              child:ReelsSideActionBar()
                            )
                          ],
                        )
                      ],
                    )


                  ],
                )

              );
            }) ,
    );
  }

}

