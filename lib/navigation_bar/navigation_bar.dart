import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';
import 'package:voice_verse/create_screen.dart';
import 'package:voice_verse/home_screen.dart';
import 'package:voice_verse/search_screen.dart';
import 'package:voice_verse/settings_screen.dart';

import '../favorite_screen.dart';


class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int screenIndex = 2  ;
  final screens = [
    const  HomeScreen(),
    const  FavoriteScreen(),
    const  CreateScreen(),
    const SearchScreen(),
    const  SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     bottomNavigationBar:Container(
       color: backGroundColor,
       child: Padding(
         padding: const EdgeInsets.all(8),
         child: GNav(
             selectedIndex: screenIndex,
             gap: 10,
             padding: const  EdgeInsets.all(17),
             onTabChange: (index){
               setState(() {
                 screenIndex = index ;
               });
             },
             backgroundColor: backGroundColor,
             color: Colors.white,
             activeColor: Colors.white,
             tabBackgroundColor: secondColor,
             tabs:  [
               GButton(icon:screenIndex == 0 ?FluentIcons.home_16_filled:FluentIcons.home_16_regular,
                 text: "Home",
               ),
               GButton(
                 icon:screenIndex ==1 ? Icons.favorite: Icons.favorite_border_outlined,
                 text: "Favorite",
               ),
               const GButton(
                 icon: Icons.add,
                 text: "Create",
                 backgroundColor: buttonColor,
               ),
               const GButton(
                 icon: FluentIcons.search_16_filled,
                 text: "Search",
               ),
               GButton(icon:screenIndex== 4?FluentIcons.settings_16_filled: FluentIcons.settings_16_regular,
                  text: "Settings",
               ),

             ]
         ),
       ),
     ),
      body: screens[screenIndex],

    );
  }
}
