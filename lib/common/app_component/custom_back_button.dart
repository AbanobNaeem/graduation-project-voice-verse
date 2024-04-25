import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class CustomBackButton extends StatelessWidget {
  final String title;




  const CustomBackButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            width: 10.w,
            height: 5.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white60,
                width: 0.3.w,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child:  Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white60,
                size: 21.sp,
              ),
            ),
        ),
        SizedBox(width: 3.w),
        Text(
          title,
          style:  TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }
}
