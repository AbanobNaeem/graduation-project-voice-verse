import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor; //
  final double opacity;
  final IconData iconButton;
  final Color iconColor;

  const CustomCircleButton({
    required this.onPressed,
    this.buttonColor = Colors.black,
    this.opacity = 0.6,
    this.iconButton = Icons.close,
    this.iconColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35, left: 10, right: 15, bottom: 10),
      decoration: BoxDecoration(
        color: buttonColor.withOpacity(opacity), // Use buttonColor with opacity
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon:Icon(
          iconButton,
          color: iconColor,
        ),
      ),
    );
  }
}

