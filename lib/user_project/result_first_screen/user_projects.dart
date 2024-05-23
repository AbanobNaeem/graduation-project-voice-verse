import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/user_project/avatar_result/screen/avatar_result.dart';
import 'package:voice_verse/user_project/cloning_result/screen/cloning_result.dart';
import 'package:voice_verse/user_project/dubbing_result/screen/dubbing_result.dart';
import 'package:voice_verse/voice_verse_pro.dart';

class UserProjects extends StatefulWidget {
  const UserProjects({super.key});

  @override
  State<UserProjects> createState() => _UserProjectsState();
}

class _UserProjectsState extends State<UserProjects> {
  String selectedOption = 'dubbing'; // Default selected option

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
                  backGroundColorDark,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.90,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/graient_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              left: 10.w,
              right: 10.w,
            ),
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/logo.png",
                                scale: 40,
                                color: primaryColorDark,
                              ),
                              Text(
                                "GetPro",
                                style: TextStyle(
                                  color: primaryColorDark,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Container(
                  width: double.infinity,
                  height: 40.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColorDark, width: 1.5.w),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                        left: selectedOption == 'dubbing'
                            ? 0
                            : selectedOption == 'cloning'
                            ? MediaQuery.of(context).size.width / 3 - 10.w
                            : 2 * MediaQuery.of(context).size.width / 3 - 20.w,
                        right: selectedOption == 'dubbing'
                            ? 2 * MediaQuery.of(context).size.width / 3 - 20.w
                            : selectedOption == 'cloning'
                            ? MediaQuery.of(context).size.width / 3 - 10.w
                            : 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3 - 10.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: primaryColorDark,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 'dubbing';
                                });
                              },
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "Dubbing",
                                    style: TextStyle(
                                      color: selectedOption == 'dubbing'
                                          ? Colors.white
                                          : primaryColorDark,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 'cloning';
                                });
                              },
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "Cloning",
                                    style: TextStyle(
                                      color: selectedOption == 'cloning'
                                          ? Colors.white
                                          : primaryColorDark,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 'avatar';
                                });
                              },
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "Avatar",
                                    style: TextStyle(
                                      color: selectedOption == 'avatar'
                                          ? Colors.white
                                          : primaryColorDark,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: selectedOption == 'dubbing'
                      ? const DubbingResult()
                      : selectedOption == 'cloning'
                      ? const CloningResult()
                      : const AvatarResult(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
