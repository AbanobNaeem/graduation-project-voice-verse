import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/downloads_tap.dart';
import 'package:voice_verse/edit_profile_screen.dart';
import 'package:voice_verse/favourites_tap.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Define the number of tabs
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: primaryColorDark.withOpacity(0.5),
                      radius: 60,
                    ),
                    const CircleAvatar(
                      radius: 57,
                      backgroundImage: AssetImage("images/user_imagejpg.jpg"),
                    )
                  ],
                ),
               const  SizedBox(height: 10),
               const  Text(
                  "Abanob Naeem",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
                const Text(
                  "abanobnaeem80@gmail.com",
                  style: TextStyle(color: Colors.white30, fontSize: 18),
                ),
               const  SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        buttonWidth: 150,
                        buttonHeight: 50,
                        onPressed: () {
                          navigateToEditProfileScreen() ;
                        },
                        text: "Edit profile"),
                   const  SizedBox(width: 10),
                    CustomButton(
                        outLine: true,
                        textColor: primaryColorDark,
                        buttonWidth: 150,
                        buttonHeight: 50,
                        onPressed: () {},
                        text: "Premium"),
                  ],
                ),
                const  SizedBox(height: 20),
                const TabBar(
                  dividerColor: backGroundColorDark,
                    indicatorColor: primaryColorDark,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs:[
                  Tab(
                      icon:Icon(
                          Icons.favorite_rounded,
                          color: Colors.white60,
                          size: 25,
                      )),
                  Tab(
                      icon: Icon(
                          Icons.download_rounded,
                          color: Colors.white60,
                          size: 25,
                      ))
                ]),
                const  Expanded(
                    child: TabBarView(
                      children: [
                         Favourites(),
                         Downloads()
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToEditProfileScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const  EditProfileScreen()));
  }
}
