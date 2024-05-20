import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class AiModelButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final GestureTapCallback onTap;

  const AiModelButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backGroundColorDark,
          border: Border.all(
            color: backGroundColorDark,
          ),
          boxShadow: [
            BoxShadow(
              color: primaryColorDark.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        height: 60.h,
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, ),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.white60,
                size: 30.sp,
              ),
              SizedBox(width: 20.w),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
