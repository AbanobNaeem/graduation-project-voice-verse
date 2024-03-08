import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class CustomSocialButton extends StatelessWidget {

  final VoidCallback onApplePressed;
  final VoidCallback onGmailPressed;
  final double topPadding;
  final bool loginMassage ;
  const CustomSocialButton({
    required this.onApplePressed,
    required this.onGmailPressed,
    this.loginMassage =true,
    this.topPadding = 30

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 10, top: topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loginMassage == true ?
            "Log in with one of the following options.":
            "Sign Up with one of the following options.",
            style: const TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: secondColorDark,
                      width: 1.5,
                    ),
                  ),
                  child: TextButton.icon(
                    onPressed: onApplePressed,
                    icon: const Icon(
                      FontAwesomeIcons.apple,
                      color: Colors.white70,
                    ),
                    label: const Text(
                      "Apple",
                      style:  TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width:10,),
              Expanded(
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: secondColorDark,
                      width: 1.5,
                    ),
                  ),
                  child: TextButton.icon(
                    onPressed: onGmailPressed,
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white70,
                    ),
                    label: const Text(
                      "Gmail",
                      style:  TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}