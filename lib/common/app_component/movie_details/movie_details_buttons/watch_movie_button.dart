import 'package:flutter/material.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';


class PositionedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PositionedButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 30,
      right: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.center,
          color: buttonColor,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
