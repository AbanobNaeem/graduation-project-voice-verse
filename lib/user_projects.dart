import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/empty_state_message.dart';
import 'package:voice_verse/voice_verse_pro.dart';


class UserProjects extends StatelessWidget {
  const UserProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      backGroundColorDark.withOpacity(0.2),
                      backGroundColorDark.withOpacity(0.4),
                      backGroundColorDark.withOpacity(0.6),
                      backGroundColorDark
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.90,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image:AssetImage(
                    "images/graient_background.jpg",
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Center(
            child: EmptyStateMessage(
                color:  Colors.white,
                scale: 3,
                imagePath: "images/icons/video-editor.png",
                mainText: "No project yet",
                subText: "Hit the button below to add your first project and see some magic"),
          ),
          Padding(
            padding: EdgeInsets.only(top:30.h ,left: 10.w , right: 10.w),
            child: Column(
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Projects",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: (){
                          showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return const VoiceVersePro();
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColorDark, width: 1.w),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 10.w,right: 10.w, top: 5.h ,bottom: 5.h),
                            child: Row(
                              children: [
                                Image.asset(
                                  "images/logo.png",
                                  scale:40,
                                  color: primaryColorDark,
                                ),
                                Text(
                                  "GetPro",
                                  style: TextStyle(
                                      color: primaryColorDark,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                      )

                    ],
                  )

              ],
            ),
          )
        ],
      ),
    );
  }
}
