import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class CloningAiModel extends StatelessWidget {
  const CloningAiModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h, // Adjust the height as needed
      decoration: const BoxDecoration(
        color: backGroundColorDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
    );
  }
}
