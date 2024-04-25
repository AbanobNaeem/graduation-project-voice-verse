import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType? keyboardType ;
  final TextInputAction? textInputAction ;
  final Widget? suffixIcon ;
  final ValueChanged<String>? onChanged ;
  final FormFieldValidator? validator;
  final int  maxLine;


  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
     required this.controller,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 2.w),
          child: Text(
            label,
            style:  TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
        ),
        SizedBox(height: 0.5.h),
        TextFormField(
          maxLines: maxLine,
          validator: validator ,
          onChanged: onChanged,
          keyboardType:keyboardType ,
          textInputAction:textInputAction,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText:  hintText,
            suffixIcon: suffixIcon,
            hintStyle:  TextStyle(
                color: Colors.white30,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:BorderSide(
                  width: 0.5.w,
                  color: secondColorDark
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:  BorderSide(width: 0.5.w, color:primaryColorDark ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:  BorderSide(width: 0.5.w, color: Colors.red.shade900 ),
            ),
            errorStyle: const  TextStyle(
              fontWeight: FontWeight.w800
            ),
          ),
          style:  TextStyle(color: Colors.white70, fontSize: 16.sp),

        ),
      ],
    );
  }
}
