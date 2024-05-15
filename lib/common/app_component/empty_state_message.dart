import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateMessage extends StatelessWidget {
  final String imagePath;
  final String mainText;
  final String subText;
  final  double scale ;
  final Color? color ;

  EmptyStateMessage({
    required this.imagePath,
    required this.mainText,
    required this.subText,
    this.scale = 3.5  ,
    this.color
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
            scale: scale,
            color: color,
          ),
          SizedBox(height: 10.h),
          Text(
            mainText,
            style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              subText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}
