import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class EditUserDataButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon ;

  const EditUserDataButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 30.sp,
            height: 30.sp,
            decoration: BoxDecoration(
                color: primaryColorDark,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Icon(
               icon,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 4.w,),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 19.sp,
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
