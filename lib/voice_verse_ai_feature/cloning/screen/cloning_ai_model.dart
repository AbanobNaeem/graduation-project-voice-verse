import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_back_button.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/voice_verse_ai_feature/cloning/cubit/cloning_cubit.dart';

class CreateCloningScreen extends StatefulWidget {
  const CreateCloningScreen({super.key});

  @override
  State<CreateCloningScreen> createState() => _CreateCloningScreenState();
}

class _CreateCloningScreenState extends State<CreateCloningScreen> {
  TextEditingController userTextController = TextEditingController();
  TextEditingController videoTitleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final cubit = CloningCubit();

  FlutterSoundRecorder? _recorder;
  String? _filePath;
  bool _isRecording = false;
  bool _hasRecorded = false;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    await _recorder!.openRecorder();
    if (await Permission.microphone.request().isGranted) {
      setState(() {});
    } else {
      CustomSnackBar.showError(context,
          message: "Microphone permission is required to record audio.",
          title: "Not Access!");
    }
  }

  Future<void> _startRecording() async {
    Directory tempDir = await getTemporaryDirectory();
    String path = '${tempDir.path}/temp.wav';
    await _recorder!.startRecorder(
      toFile: path,
      codec: Codec.pcm16WAV,
    );
    setState(() {
      _filePath = path;
      _isRecording = true;
      _hasRecorded = true;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder!.stopRecorder();
    setState(() {
      _isRecording = false;
    });
  }

  @override
  void dispose() {
    _recorder!.closeRecorder();
    _recorder = null;
    userTextController.dispose();
    videoTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<CloningCubit, CloningStates>(
        listener: (context, state) {
          if (state is CloningFailureState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage, title: "Cloning Error");
          }
          if (state is CloningSuccessState) {
            CustomSnackBar.showSuccess(context,
                message: "your cloning audio created successfully",
                title: "Audio Created");
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
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.40,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "images/graient_background.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 5.h, left: 10.w, right: 10.w, bottom: 5.h),
                          child: Column(
                            children: [
                              CustomBackButton(
                                width: 85,
                                title: "Cloning",
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Image.asset(
                                  'images/logo.png',
                                  scale: 7,
                                ),
                              ),
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field cannot be empty';
                                  }
                                  return null; // Return null if the input is valid
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                label: "Text To Speech",
                                hintText: "Enter Your Text",
                                controller: userTextController,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                    child: Column(
                      children: [
                        CustomButton(
                            outLine: true,
                            outlineColor: _isRecording
                                ? Colors.red.shade900
                                : primaryColorDark,
                            textColor: _isRecording
                                ? Colors.red.shade900
                                : primaryColorDark,
                            onPressed: () {
                              if (_isRecording) {
                                _stopRecording();
                              } else {
                                _startRecording();
                              }
                            },
                            text: _isRecording ? "Recording..." : "Add Record"),
                        SizedBox(
                          height: 20.h,
                        ),
                        BlocBuilder<CloningCubit, CloningStates>(
                          builder: (context, state) {
                            return CustomButton(
                              backGroundColor: primaryColorDark,
                              isLoading:
                                  state is! CloningLoadingState ? false : true,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_hasRecorded) {
                                    cubit.cloning(
                                      textToSpeech: userTextController.text,
                                      title: videoTitleController.text,
                                      audioFile: File(_filePath!),
                                    );

                                  } else {
                                    CustomSnackBar.showError(context,
                                        message:
                                            "Please make a recording before creating.",
                                        title: "oops!");
                                  }
                                }
                              },
                              text: "Create",
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
