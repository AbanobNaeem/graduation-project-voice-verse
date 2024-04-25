import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReelDetails extends StatelessWidget {
  ReelDetails({
    Key? key,
    required this.userImage,
    required this.userName ,
    required this.description
  }) : super(key: key);
  final String userImage;
  final String userName ;
  final String description ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 3.w,
            title: Text(
               userName,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp
              ),
            ),
            leading: CircleAvatar(
              radius: 17.5.sp,
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.5.w),
            child: ExpandableText(
               description,
              style: TextStyle(
                    fontSize: 15.sp,
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
                  fontSize: 15.sp
                ),
            ),
          ),
        ],
      ),
    );
  }
}
