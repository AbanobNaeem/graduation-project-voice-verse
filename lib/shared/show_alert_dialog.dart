import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

void showAlertDialog(
    BuildContext context, {
      String? title,
      String? content,
      List<Widget>? actions,
    }) {
  showDialog(
    context: context,
    barrierColor: backGroundColorDark.withOpacity(0.7),
    builder: (context) => AlertDialog(
      title: Text(
        title! ,
        style:   const TextStyle(
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
      actions: actions,
      backgroundColor: Colors.black,

    ),
  );
}
