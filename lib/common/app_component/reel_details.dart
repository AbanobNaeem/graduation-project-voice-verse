import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReelDetails extends StatelessWidget {
  ReelDetails({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.description
  }) : super(key: key);
  final String userImage;
  final String userName;

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 10.w,
          title: Text(
            userName.isEmpty ? "deleted account" : userName,
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
                fontSize: 15.sp
            ),
          ),
          leading: CircleAvatar(
              radius: 15.sp,
              backgroundImage :userImage.isNotEmpty ?
              NetworkImage(userImage) :
              NetworkImage("https://res.cloudinary.com/dc4zgmrmf/image/upload/v1710460050/VoiceVerse%20defaults/user/WhatsApp_Image_2024-03-11_at_19.05.02_iowoqo.jpg")
        )
    ),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.5.w),
    child: ExpandableText(
    description,
    style: TextStyle(
    fontSize: 13.sp,
    color: Colors.white70,
    fontWeight: FontWeight.w500
    ),
    expandText: "more",
    collapseText: "less",
    expandOnTextTap: true,
    collapseOnTextTap: true,
    maxLines: 1,
    linkColor: Colors.white38,
    linkEllipsis: false,
    linkStyle: TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 13.sp
    ),
    ),
    ),
    ],
    )
    ,
    );
  }
}
