import 'package:flutter/material.dart';

class ReelsSideActionBar extends StatelessWidget {
  const ReelsSideActionBar({super.key});
  final double _iconSize = 30;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: (){},
            icon: const Icon(
              Icons.favorite_rounded,
              color: Colors.white,
            ),
          iconSize: _iconSize,
        ),
        const SizedBox(height: 10,),
        IconButton(onPressed: (){},
          icon: const Icon(
            Icons.download_rounded,
            color: Colors.white,
          ),
          iconSize: _iconSize,
        ),
        const SizedBox(height: 10,),
        IconButton(onPressed: (){},
          icon: const Icon(
            Icons.more_horiz_rounded,
            color: Colors.white,
          ),
          iconSize: _iconSize,
        ),
        const SizedBox(height: 10,),
        Container(
         height: 40,
         width: 40,
         decoration: BoxDecoration(
           border: Border.all(
             color: Colors.white,
             width: 1,
           ),
           borderRadius: BorderRadius.circular(8),
           image: const DecorationImage(
             fit: BoxFit.cover,
               image:AssetImage("images/user_imagejpg.jpg"))
         ),
       ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
