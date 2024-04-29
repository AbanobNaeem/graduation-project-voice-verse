import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/upload_video/cubit/upload_video_cubit.dart';

import '../../navigation_bar/navigation_bar.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  final String videoUrl;

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final cubit = UploadVideoCubit();
  late Future<ImageProvider?> _thumbnailFuture;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _thumbnailFuture = _loadThumbnail();
  }

  Future<ImageProvider?> _loadThumbnail() async {
    final thumbnail = await VideoThumbnail.thumbnailData(
      video: widget.videoUrl,
      imageFormat: ImageFormat.JPEG,
      timeMs: 2000, // Time in milliseconds (2nd second)
    );
    return thumbnail != null ? MemoryImage(thumbnail) : null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocListener<UploadVideoCubit, UploadVideoStates>(
        listener: (context, state) {
          if (state is UploadVideoSuccessState) {
            navigatAndReplace(
                context, screen: BottomNavigationBarWidget(screenIndex: 0,));
          }
          if (state is UploadVideoFailureState) {
            CustomSnackBar.showError(context,
                message: "Error in Upload video", title: "Failed");
          }
        },
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.h),
              child: Container(
                color: secondColorDark,
                height: 1.h,
              ),
            ),
            backgroundColor: backGroundColorDark,
            centerTitle: true,
            title: Text(
              "Post",
              style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white60,
              ),
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder<ImageProvider?>(
                      future: _thumbnailFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator(); // Placeholder while loading thumbnail
                        } else if (snapshot.hasError) {
                          return const Text('Error loading thumbnail');
                        } else {
                          final ImageProvider? thumbnail = snapshot.data;
                          return Container(
                            width: 150.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: primaryColorDark,
                                width: 1.w
                              ),
                              image: thumbnail != null
                                  ? DecorationImage(
                                image: thumbnail,
                                fit: BoxFit.cover,
                              )
                                  : null,
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 5.h),
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      label: 'Title',
                      hintText: 'Add title to your video.',
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      maxLine: 2,
                      label: 'Description',
                      hintText: 'Create more informative content when you go into greater detail with 4000 characters.',
                      controller: descriptionController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    SizedBox(height: 15.h,),
                    BlocBuilder<UploadVideoCubit, UploadVideoStates>(
                      builder: (context, state) {
                        return CustomButton(
                          backGroundColor: primaryColorDark,
                          isLoading:
                          state is! UploadVideoLoadingState ? false : true,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              cubit.uploadVideo(
                                  videoUrl: widget.videoUrl,
                                  description: descriptionController.text,
                                  title: titleController.text
                              );
                            }
                          } , text: "Upload",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
