import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class EmptyStateMessage extends StatelessWidget {
  final String imagePath;
  final String mainText;
  final String subText;

  EmptyStateMessage({
    required this.imagePath,
    required this.mainText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            color: Colors.white38,
            scale: 3.5,
          ),
          SizedBox(height: 1.h),
          Text(
            mainText,
            style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 1.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              subText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}
