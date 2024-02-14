import 'package:flutter/material.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';


class CategoryNameAndButton extends StatelessWidget {
  final String title;
  final bool showButton;
  final VoidCallback? onPressed;

  CategoryNameAndButton({
    required this.title,
    this.showButton = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (showButton)
            TextButton(
              onPressed: onPressed,
              child: const Text(
                "See All",
                style: TextStyle(
                  color: buttonColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
