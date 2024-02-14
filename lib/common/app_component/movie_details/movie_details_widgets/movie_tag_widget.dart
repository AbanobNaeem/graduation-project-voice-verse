import 'package:flutter/material.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';


class MovieTags extends StatelessWidget {
  final List<String> tags ;
  const MovieTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          shrinkWrap:true,
          scrollDirection:Axis.horizontal,
          itemCount:tags.length,
          itemBuilder: (context,index){
            return tagsWidget(tags, index);
          }
      ),
    );
  }
  Widget tagsWidget(final List<String> tags ,int index){
    return Container(
      margin: const EdgeInsets.only(top: 20,right: 10),
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
      decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(18)
      ),
      child: Text(tags[index],
        style: const TextStyle(
            color: Colors.white30,
            fontSize: 16
        ),
      ),
    );
  }
}
