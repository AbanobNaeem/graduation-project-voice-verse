import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_component/empty_state_message.dart';

class AvatarResult extends StatelessWidget {
  const AvatarResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding:  EdgeInsets.only(bottom: 25.h),
        child: const EmptyStateMessage(
            imagePath: "images/icons/video-editor.png",
            color: Colors.white,
            scale: 3,
            mainText: "No Project yet!",
            subText: "Hit the button below to add your first project and see some magic."),
      ),
    );
  }
}
