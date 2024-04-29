import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;


  const CustomBackButton({
    Key? key,
    required this.title,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            width: 40.w,
            height: 35.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white60,
                width: 0.5.w,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child:  Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white60,
                size: 23.sp,
              ),
            ),
        ),
        SizedBox(width: 10.w),
        Text(
          title,
          style:  TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
            fontSize: 25.sp,
          ),
        ),
      ],
    );
  }
}
