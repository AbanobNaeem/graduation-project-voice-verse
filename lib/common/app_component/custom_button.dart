import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final double buttonWidth ;
  final Color backGroundColor ;
  final Color textColor ;
  final double buttonRadius ;
  final double buttonHeight ;
  final bool outLine  ;
  final bool isLoading ;
  final Color outlineColor ;



  const CustomButton({
    required this.onPressed,
    required this.text,
    this.buttonWidth = double.infinity,
    this.backGroundColor = primaryColorDark,
    this.textColor = Colors.white,
    this.buttonRadius = 15,
    this.buttonHeight  = 50,
    this.outLine = false,
    this.isLoading= false,
    this.outlineColor = primaryColorDark ,

  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: buttonWidth.w,
        height: buttonHeight.h,
        decoration: outLine == false ?
        BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(buttonRadius),
        ):
        BoxDecoration(
          borderRadius: BorderRadius.circular(buttonRadius),
          border: Border.all(
            color: outlineColor ,
            width: 1.w,
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: isLoading == false ?Text(
            text!,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 19.sp,
            ),
          ) : const AnimatedLoadingWavingLine(color: Colors.white,),
        )
      )
    );
  }
}
