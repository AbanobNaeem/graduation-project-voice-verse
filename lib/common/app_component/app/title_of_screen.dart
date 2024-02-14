import 'package:flutter/material.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';

class TitleOfScreen extends StatelessWidget {
  final String title;
  final String? userImage;
  final VoidCallback? userProfileOnPressed;

  final VoidCallback? onPressed;
  final IconData? buttonIcon;
  final String? buttonTitle;

  final Widget? widget ;

  TitleOfScreen({
    required this.title,
    this.userImage,
    this.userProfileOnPressed,
    this.onPressed,
    this.buttonIcon,
    this.buttonTitle,
    this.widget
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (userImage == null && buttonTitle != null)
            OutlinedButton.icon(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1, color: buttonColor),
              ),
              icon: Icon(
                buttonIcon!,
                color: buttonColor,
              ),
              label: Text(
                buttonTitle!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          if (userImage != null)
            InkWell(
              onTap: userProfileOnPressed,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: buttonColor,
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(userImage!),
                  ),
                ],
              ),
            ),
          if(widget != null)
            widget!

        ],
      ),
    );
  }
}
