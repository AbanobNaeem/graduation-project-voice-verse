import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class CustomSocialButton extends StatelessWidget {
  final VoidCallback onApplePressed;
  final VoidCallback onGmailPressed;
  final bool loginMessage;

  const CustomSocialButton({super.key, 
    required this.onApplePressed,
    required this.onGmailPressed,
    this.loginMessage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loginMessage
              ? "Log in with one of the following options."
              : "Sign Up with one of the following options.",
          style: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: secondColorDark,
                    width: 1.w,
                  ),
                ),
                child: TextButton.icon(
                  onPressed: onApplePressed,
                  icon: Icon(
                    FontAwesomeIcons.apple,
                    color: Colors.white70,
                    size: 22.sp,
                  ),
                  label: Text(
                    "Apple",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: secondColorDark,
                    width: 1.w,
                  ),
                ),
                child: TextButton.icon(
                  onPressed: onGmailPressed,
                  icon: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white70,
                    size: 22.sp,
                  ),
                  label: Text(
                    "Gmail",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: secondColorDark,
                thickness: 1.h,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "Or With",
              style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Divider(
                color: secondColorDark,
                thickness: 1.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
