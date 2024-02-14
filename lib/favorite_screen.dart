import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_component/app/title_of_screen.dart';
import 'package:voice_verse/common/app_component/app/toggle_button.dart';
import 'package:voice_verse/common/app_messages_design/empty_state_message.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';



class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            TitleOfScreen(
              title: "Favorites",
              widget: ToggleButtonsSwitch(
                onSelectedChanged: (ThatSelect){
                  setState(() {

                  });
                },
              ),
            ),

            const SizedBox(height: 40,),
            EmptyStateMessage(
                imagePath: "images/icons/broken-heart.png",
                mainText: "No Favorites yet",
                subText: 'Explore your home feed and uncover new favorites waiting for you',
                subTextWidth: 280,
            ),
          ],
        ),
      )
    );
  }
}
