import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
            padding: EdgeInsets.only(top: 10.h),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 33.5.sp,
                          backgroundColor: primaryColorDark,
                        ),
                        CircleAvatar(
                          radius: 33.sp,
                          backgroundImage: NetworkImage(widget.userImage),
                        ),
                        CircleAvatar(
                          radius: 33.sp,
                          backgroundColor: Colors.black.withOpacity(0.2),
                          child: IconButton(
                            onPressed: _pickImage,
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white60,
                              size: 30.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Center(
                    child: Text(
                      widget.userName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.userEmail,
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: backGroundColorDark,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 2.h, right: 5.w, left: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 20.w,
                              height: 0.5.h,
                              decoration: BoxDecoration(
                                  color: secondColorDark,
                                  borderRadius:
                                  BorderRadius.circular(25)),
                            ),
                            SizedBox(height: 5.h),
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
                            SizedBox(height: 3.h),
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
                            SizedBox(height: 3.h),
                            EditUserDataButton(
                                title: "My Status",
                                onTap: () {},
                                icon: Icons.stacked_bar_chart_rounded),
                            SizedBox(height: 5.h),
                            Divider(
                              height: 0.5.h,
                              color: secondColorDark,
                            ),
                            SizedBox(height: 3.h),
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
