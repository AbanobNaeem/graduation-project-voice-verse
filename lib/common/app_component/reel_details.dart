import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class ReelDetails extends StatelessWidget {
  const ReelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 12,
          title: Text(
            "Mohamed ahmed",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 15
            ),
          ),
          leading: CircleAvatar(
            radius: 18,
            backgroundImage:AssetImage(
              "images/user_imagejpg.jpg"
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: ExpandableText(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
            style: TextStyle(
                  fontSize: 15,
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
              ),
          ),
        ),
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: 5,
          title: Text(
            "music title - original music",
            style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w600
            ),
          ),
          leading: Icon(Icons.graphic_eq_outlined,
            size: 16,
            color: Colors.white54,
          )
        ),
      ],
    );
  }
}
