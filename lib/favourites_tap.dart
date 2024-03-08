import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context , index ){
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: secondColorDark,
            ),
          ) ;
        }
    );
  }
}
