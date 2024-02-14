import 'package:flutter/material.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';


class SearchTextFieldComponent extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Color hintColor;
  final Color iconColor;
  final Color textFieldColor;
  final Color cursorColor;


  SearchTextFieldComponent({
    required this.hintText,
    required this.prefixIcon,
    this.hintColor = Colors.white30,
    this.iconColor = Colors.white30,
    this.textFieldColor = secondColor,
    this.cursorColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: textFieldColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            cursorColor: cursorColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintColor,
                fontSize: 18,
              ),
              prefixIcon: Icon(
                prefixIcon,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
