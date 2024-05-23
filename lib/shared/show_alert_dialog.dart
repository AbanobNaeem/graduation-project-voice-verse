import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';

void showAlertDialog(BuildContext context, {
  String? title,
  String? content,
  String? buttonTitle ,
  VoidCallback? onTap


}) {
  showDialog(
    context: context,
    barrierColor: Colors.white.withOpacity(0.2),
    builder: (context) =>
        AlertDialog(
          title: Text(
            title!,
            style:  TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 25.sp
            ),
          ),
          content: Text(
            content!,
            style:  TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp
            ),
            textAlign: TextAlign.justify,
          ),
          actions: [
            CustomButton(
              onPressed: onTap ,
              text: buttonTitle,
              outLine: true,
              textColor: Colors.red.shade900,
              outlineColor: Colors.red.shade900 ,
            ),
            SizedBox(height: 10.h,),
            CustomButton(
              backGroundColor: secondColorDark.withOpacity(0.6),
                onPressed: () {
              Navigator.pop(context);
            },
                text: "cancel")
          ],
          backgroundColor: backGroundColorDark,

        ),
  );
}




