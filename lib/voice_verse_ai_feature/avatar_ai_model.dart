import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';


class AvatarAiModel extends StatelessWidget {
  const AvatarAiModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      backGroundColorDark.withOpacity(0.9),
                      backGroundColorDark.withOpacity(0.7),
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.45,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image:AssetImage(
                    "images/graient_background.jpg",
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:50.h ,left: 10.w , right: 10.w),
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  width: 250.w,
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
