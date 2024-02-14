import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_component/app/toggle_button.dart';
import 'package:voice_verse/common/app_component/home_screen/home_screen_buttons/category_button_component.dart';
import 'package:voice_verse/common/app_component/app/title_of_screen.dart';
import 'package:voice_verse/common/app_component/home_screen/home_screen_cards/custom_for_you_card.dart';
import 'package:voice_verse/common/app_component/home_screen/home_screen_cards/custom_genres_card.dart';
import 'package:voice_verse/common/app_component/home_screen/home_screen_cards/custom_normal_card.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';
import 'package:voice_verse/movie_details_screen.dart';
import 'package:voice_verse/movie_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> forYouItemList = List.of(forYouImages);
  List<MovieModel> popularItemList = List.of(popularImages);
  List<MovieModel> genresItemList = List.of(genresImages);
  List<MovieModel> legendaryItemList = List.of(legendaryImages);
  bool homeSelected = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body:
        SafeArea(child:
              SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleOfScreen(
                      title: "Hi, Abanob!",
                      userImage: "images/user_imagejpg.jpg",
                      userProfileOnPressed: (){},

                  ),
                  ToggleButtonsSwitch(
                    onSelectedChanged: (ThatSelect){
                      setState(() {
                        homeSelected = ThatSelect ;
                      });
                      },
                  ),
                  homeSelected == true ?
                  Column(
                    children: [
                      CategoryNameAndButton(
                        title: "For You",
                        showButton: false,
                      ),
                      CustomForYouCard(
                          movieList: forYouItemList,
                          onItemClicked: (index){
                            print('index for you === ${index}');
                          }),
                      CategoryNameAndButton(title: "Popular",
                        onPressed: (){},
                      ),
                      CustomNormalCard(
                          movieList: popularItemList,
                          onItemClicked:(index){
                            navigatToMovie(popularItemList,index);
                          }),
                      CategoryNameAndButton(title: "Genres", onPressed: (){},),
                      CustomGenresCard(
                          genresList: genresItemList,
                          onItemClicked: (index){
                            print('index is =====>${index}');
                          }),
                      CategoryNameAndButton(title: "Legendary Movies",
                        onPressed: (){},),
                      CustomNormalCard(movieList: legendaryItemList, onItemClicked: (index){
                        print('legendaryItem index == ${index}');
                      }),
                    ],
                  ):
                  Container(),




                ],
              ),
            ))
    );
  }

  void navigatToMovie(data,index) {
    Navigator.push(context,MaterialPageRoute(
        builder: (context){
          return MovieDetails(movieList: data, index: index);
        }
    ));
  }
}
