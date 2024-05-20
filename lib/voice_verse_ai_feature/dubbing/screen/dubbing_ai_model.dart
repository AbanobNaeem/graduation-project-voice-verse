import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_back_button.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/voice_verse_ai_feature/dubbing/cubit/dubbing_cubit.dart';

class CreateDubbingScreen extends StatefulWidget {
  const CreateDubbingScreen({super.key});

  @override
  State<CreateDubbingScreen> createState() => _CreateDubbingScreenState();
}

class _CreateDubbingScreenState extends State<CreateDubbingScreen> {
  final TextEditingController videoUrlController = TextEditingController();
  final TextEditingController videoTitleController = TextEditingController();
  final TextEditingController videoDescriptionController = TextEditingController();
  final cubit = DubbingCubit();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<DubbingCubit, DubbingStates>(
        listener: (context, state) {
          if (state is DubbingFailureState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage, title: "dubbing Failed");
          }
          if (state is DubbingSuccessState) {
            CustomSnackBar.showSuccess(context,
                message: "your dubbing audio created successfully",
                title: "Audio created");
                Navigator.pop(context);
          }

        },
        child: Scaffold(
          body: SingleChildScrollView(
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
                              backGroundColorDark
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            "images/graient_background.jpg",
                          ),
                          fit: BoxFit.cover,
                        )),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 5.h, left: 10.w, right: 10.w, bottom: 5.h),
                          child: Column(
                            children: [
                              CustomBackButton(
                                  width: 85,
                                  title: "Dubbing",
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Image.asset(
                                  'images/logo.png',
                                  scale: 7,
                                ),
                              ),
                              CustomTextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a URL';
                                  }
                                  // Basic URL validation
                                  // final urlPattern = r'^(https?:\/\/)?((www\.)?youtube\.com|youtu\.?be|vimeo\.com)\/.+$';
                                  // final result = RegExp(urlPattern, caseSensitive: false).hasMatch(value);
                                  // if (!result) {
                                  //   return 'Please enter a valid video URL';
                                  // }
                                  // return null; // Return null if the input is valid
                                },
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.next,
                                label: "URL",
                                hintText: "Enter URL Video",
                                controller: videoUrlController,
                              )

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
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

                        SizedBox(
                          height: 10.h,
                        ),
                        BlocBuilder<DubbingCubit, DubbingStates>(
                          builder: (context, state) {
                            return CustomButton(
                              backGroundColor: primaryColorDark,
                              isLoading: state is! DubbingLoadingState ? false : true,
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  cubit.dubbing(
                                      title: videoTitleController.text,
                                      description: videoDescriptionController.text,
                                      videoUrl: videoUrlController.text
                                  );
                                }

                              },
                              text: "Create",
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
