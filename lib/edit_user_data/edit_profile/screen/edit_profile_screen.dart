import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/edit_item_button.dart';
import 'package:voice_verse/edit_user_data/change_user_data/screen/change_user_data.dart';
import 'package:voice_verse/edit_user_data/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:voice_verse/navigation_bar/navigation_bar.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/snack_bar.dart';

class EditProfileScreen extends StatefulWidget {
  final String userName;
  final String userImage;
  final String userEmail;

  const EditProfileScreen({
    Key? key,
    required this.userName,
    required this.userImage,
    required this.userEmail,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late EditProfileCubit cubit;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    cubit = EditProfileCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocListener<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {
          if (state is UserProfileUploadFailure) {
            CustomSnackBar.showError(context,
                message: state.errorMessage, title: "Failed");
          }
          if (state is UserProfileUploadSuccess) {
            navigatTo(context,
                screen: BottomNavigationBarWidget(
                  dataUpdated: true,
                  screenIndex: 2,
                ));
          }
        },
        child: Scaffold(
          backgroundColor: secondColorDark,
          body: Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60.sp,
                          backgroundColor: primaryColorDark,
                        ),
                        CircleAvatar(
                          radius: 57.sp,
                          backgroundImage: NetworkImage(widget.userImage),
                        ),
                        CircleAvatar(
                          radius: 57.sp,
                          backgroundColor: Colors.black.withOpacity(0.2),
                          child: IconButton(
                            onPressed: _pickImage,
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white60,
                              size: 50.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Center(
                    child: Text(
                      widget.userName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25.sp),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.userEmail,
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: backGroundColorDark,
                          borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, right: 10.w, left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                  color: secondColorDark,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                            ),
                            SizedBox(height: 30.h),
                            EditUserDataButton(
                                title: "Edit Name",
                                onTap: () {
                                  navigatTo(
                                      context,
                                      screen: ChangeUserDate(
                                        isPassword: false,
                                        userName: widget.userName,
                                      ));
                                },
                                icon: Icons.person_rounded),
                            SizedBox(height: 20.h),
                            EditUserDataButton(
                                title: "Edit Password",
                                onTap: () {
                                  navigatTo(
                                      context,
                                      screen: ChangeUserDate(
                                        isPassword: true,
                                        userName: widget.userName,
                                      ));
                                },
                                icon: Icons.lock_rounded),
                            SizedBox(height: 20.h),
                            EditUserDataButton(
                                title: "My Status",
                                onTap: () {},
                                icon: Icons.stacked_bar_chart_rounded),
                            SizedBox(height:20.h),
                            Divider(
                              height: 1.h,
                              color: secondColorDark,
                            ),
                            SizedBox(height: 25.h),
                            CustomButton(
                                outLine: true,
                                outlineColor: secondColorDark,
                                textColor: primaryColorDark,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: "Back"),
                          ],
                        ),
                      ),
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

  void _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imagePath =
      File(pickedFile.path); // Create a File object using the path
      cubit.changeUserImage(image: imagePath);
    }
  }
}
