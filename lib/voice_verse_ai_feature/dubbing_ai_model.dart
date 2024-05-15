import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_back_button.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';


class DubbingAiModel extends StatelessWidget {
  const DubbingAiModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
                  height: MediaQuery.of(context).size.height*0.45,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage(
                          "images/graient_background.jpg",
                        ),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 10.w,right: 10.w, bottom: 5.h ),
                    child: Column(
                      children: [
                        CustomBackButton(
                           width: 83,
                            title:"Dubbing",

                            onPressed: (){
                          Navigator.pop(context);
                            }),
                        SizedBox(height: 25.h,),
                        Padding(
                          padding:  EdgeInsets.only(left: 15.w),
                          child: Image.asset(
                            'images/logo.png',
                            width: 250.w,
                          ),
                        ),
                        SizedBox(height: 7.h,),
                        CustomTextFormField(
                            label: "URL",
                            hintText: "Enter URL Video",
                            controller: TextEditingController())
                      ],
                    ),
                  ),
                )
        
        
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: 10.h, left: 10.w,right: 10.w ),
              child: Column(
                children: [
                  CustomTextFormField(
                      label: "Title",
                      hintText: "Enter Video Title",
                      controller: TextEditingController()),
                  SizedBox(height: 10.h,),
                  CustomTextFormField(
                      maxLine: 3,
                      label: "Description",
                      hintText: "Enter Video Description",
                      controller: TextEditingController()),
                  SizedBox(height: 20.h,),
                  CustomButton(
                      onPressed: (){},
                      text: "Create")
                ],
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
