import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_component/app/title_of_screen.dart';
import 'package:voice_verse/common/app_messages_design/empty_state_message.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';



class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backGroundColor,

     body: SafeArea(
       child: Column(
         children: [
           TitleOfScreen(
               title:'My Projects',
               buttonIcon: Icons.waves,
               buttonTitle: "New Project",
               onPressed: (){},
           ),
           EmptyStateMessage(
               imagePath: "images/icons/video-editor.png",
               mainText: "No project yet",
               subText: "Hit the button above to add your first project and see some magic"),
         ],
       ),
     ),
    );
  }
}
