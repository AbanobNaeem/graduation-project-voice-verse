import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final double topPadding  ;
  final TextInputType? keyboardType ;
  final TextInputAction? textInputAction ;
  final Widget? suffixIcon ;
  final ValueChanged<String>? onChanged ;
  final FormFieldValidator? validator;


  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
     required this.controller,
    this.topPadding =20,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            validator: validator ,
            onChanged: onChanged,
            keyboardType:keyboardType ,
            textInputAction:textInputAction,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText:  hintText,
              suffixIcon: suffixIcon,
              hintStyle: const TextStyle(color: Colors.white60),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:const BorderSide(width: 1.5,
                    color: secondColorDark
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 1.5, color:primaryColorDark ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:  BorderSide(width: 1.5, color: Colors.red.shade900 ),
              ),

            ),
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
