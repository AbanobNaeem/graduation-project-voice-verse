import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class CustomTextAndButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool moveToLogin;

  final bool isTitle;

  final String? message;

  final String? buttonTitle;

  const CustomTextAndButton(
      {required this.onPressed,
      this.moveToLogin = false,
      this.isTitle = false,
      this.message,
      this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isTitle == false
              ? moveToLogin == false
                  ? "Don't have an account?"
                  : "Already have an account?"
              : message!,
          style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            isTitle == false
                ? moveToLogin == false
                    ? "Sign Up"
                    : "Log In"
                : buttonTitle!,
            style: TextStyle(
                color: primaryColorDark,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp),
          ),
        )
      ],
    );
  }
}
