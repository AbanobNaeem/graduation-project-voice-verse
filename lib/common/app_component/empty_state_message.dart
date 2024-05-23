import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateMessage extends StatelessWidget {
  final String imagePath;
  final String mainText;
  final String subText;
  final  double scale ;
  final Color? color ;

  const EmptyStateMessage({super.key, 
    required this.imagePath,
    required this.mainText,
    required this.subText,
    this.scale = 3.5  ,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              fontSize: 25.sp,
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
                fontSize: 16.sp,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}
