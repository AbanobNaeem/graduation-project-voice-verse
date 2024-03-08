import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class EmptyStateMessage extends StatelessWidget {
  final String imagePath;
  final String mainText;
  final String subText;
  final double? subTextWidth;

  EmptyStateMessage({
    required this.imagePath,
    required this.mainText,
    required this.subText,
    this.subTextWidth = 260
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              color: secondColorDark,
              scale: 3.5,
            ),
            const SizedBox(height: 5,),
            Text(
              mainText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: subTextWidth,
              child: Text(
                subText,
                textAlign: TextAlign.center,
                style:const  TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
