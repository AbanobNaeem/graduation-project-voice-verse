import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_back_button.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/common/app_component/upload_button.dart';


class AvatarAiModel extends StatefulWidget {
  const AvatarAiModel({super.key});

  @override
  State<AvatarAiModel> createState() => _AvatarAiModelState();
}

class _AvatarAiModelState extends State<AvatarAiModel> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController   videoTitleController  =TextEditingController();
  final TextEditingController videoDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                              backGroundColorDark,



                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        )
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.40,
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
                      padding: EdgeInsets.only(top: 5.h, left: 10.w,right: 10.w, bottom: 5.h ),
                      child: Column(
                        children: [
                          CustomBackButton(
                              width: 100,
                              title:"Avatar",
                              onPressed: (){
                                Navigator.pop(context);
                              }),
                          SizedBox(height: 15.h,),
                          Padding(
                            padding:  EdgeInsets.only(left: 5.w, right: 5.w),
                            child: Row(
                              children: [
                               Expanded(
                                 child: CustomUploadButton(
                                     onTap: (){},
                                     icon: Icons.image_rounded,
                                     title: "Upload Image"),
                               ),
                                SizedBox(width: 20.w,),
                                Expanded(
                                  child: CustomUploadButton(
                                      onTap: (){},
                                      icon: Icons.audio_file_rounded,
                                      title: "Upload Audio"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )


                ],
              ),
              Padding(
                padding:  EdgeInsets.only( top:10.h , left: 10.w,right: 10.w ),
                child: Column(
                  children: [
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      label: "Title",
                      hintText: "Enter Video Title",
                      controller: videoTitleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a video title';
                        }
                        if (value.length < 5) {
                          return 'Title must be at least 5 characters long';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLine: 3,
                      label: "Description",
                      hintText: "Enter Video Description",
                      controller: videoDescriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a video description';
                        }
                        if (value.length < 10) {
                          return 'Description must be at least 10 characters long';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    SizedBox(height: 20.h,),
                    CustomButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            print("Success");
                          }
                        },
                        text: "Create")
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
