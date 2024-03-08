import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_component/empty_state_message.dart';



class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
     body: SafeArea(
       child: Column(
         children: [
           Expanded(
             flex: 2,
             child: EmptyStateMessage(
               subTextWidth: 270,
                 imagePath: "images/icons/video-editor.png",
                 mainText: "No project yet",
                 subText: "Hit the button below to add your first project and see some magic"),
           ),
         ],
       ),
     ),
    );
  }
}
