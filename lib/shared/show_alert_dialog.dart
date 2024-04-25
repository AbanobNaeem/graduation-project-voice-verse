import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800
            ),
          ),
          content: Text(
            content!,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16
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
            const SizedBox(height: 10,),
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




