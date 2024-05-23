import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class EditUserDataButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon ;

  const EditUserDataButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50.sp,
            height: 50.sp,
            decoration: BoxDecoration(
                color: primaryColorDark,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Icon(
               icon,
              color: Colors.white,
              size: 30.sp,
            ),
          ),
          SizedBox(width: 10.w,),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          )

        ],
      ),
    );
  }
}
