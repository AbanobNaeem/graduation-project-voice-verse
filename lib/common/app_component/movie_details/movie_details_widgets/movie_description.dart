import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';

class MovieDescription extends StatelessWidget {
  final String description;


  const MovieDescription({
    required this.description,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 10),
      child: ReadMoreText(
        description,
        trimLines: 3,
        trimMode: TrimMode.Line,
        moreStyle:const  TextStyle(color: buttonColor), // default to blue if buttonColor is not provided
        lessStyle:const  TextStyle(color: buttonColor), // default to blue if buttonColor is not provided
        style: const TextStyle(
          color: Colors.white70,
          height: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
