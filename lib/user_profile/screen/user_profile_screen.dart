import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/edit_item_button.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/edit_user_data/edit_profile/screen/edit_profile_screen.dart';
import 'package:voice_verse/favorite_screen/screen/favourites_screen.dart';
import 'package:voice_verse/models/user_data_model.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/show_alert_dialog.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/uploaded_videos/screen/uploaded_videos_screen.dart';
import 'package:voice_verse/user_authentication/login/screen/login_screen.dart';
import 'package:voice_verse/user_profile/cubit/user_profile_cubit.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key, required this.dataUpdated});

  bool dataUpdated;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final cubit = UserProfileCubit();
  UserDataModel? userData;

  @override
  void initState() {
    super.initState();
    if (widget.dataUpdated == true) {
      cubit.getUserData();
      setState(() {
        widget.dataUpdated = false;
      });
    } else {
      getCachedUserData().then((cachedUserData) {
        if (cachedUserData != null) {
          setState(() {
            userData = cachedUserData;
          });
        } else {
          cubit.getUserData();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocBuilder<UserProfileCubit, UserProfileStates>(
        builder: (context, state) {
          if (state is LogOutFailureState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage, title: "Failed");
          }
          if (state is DeleteAccountFailureState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage, title: "Failed");
          }
          if (userData != null) {
            return buildContent(userData!);
          } else if (state is GetDataLoadingState) {
            return const Center(
              child: AnimatedLoadingWavingLine(
                color: primaryColorDark,
              ),
            );
          } else if (state is GetDataSuccessState) {
            cacheUserData(state.user);
            return buildContent(state.user);
          } else {
            return const Center(child: AnimatedLoadingWavingLine(color: primaryColorDark,));
          }
        },
      ),
    );
  }

  Widget buildContent(UserDataModel userData) {
    return Scaffold(
      backgroundColor: secondColorDark,
      body: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60.sp,
                    backgroundColor:primaryColorDark
                  ),
                  CircleAvatar(
                    radius: 56.sp,
                    backgroundImage: NetworkImage(userData.result!.profileImage!.url!),
                  ),
                ],
              ),
              SizedBox(height: 5.h,),
              Text(
                userData.result!.userName!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25.sp),
              ),
              Text(
                userData.result!.email.toString(),
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp),
              ),
              SizedBox(height: 20.h,),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: backGroundColorDark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
                    child: Column(
                      children: [
                        Container(
                          width: 100.w,
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: secondColorDark,
                            borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        EditUserDataButton(
                            title: "Edit Profile",
                            onTap: () {
                              navigatTo(context,
                                  screen: EditProfileScreen(
                                    userImage: userData.result!.profileImage!.url.toString(),
                                    userName: userData.result!.userName.toString(),
                                    userEmail: userData.result!.email.toString(),
                                  ));
                            },
                            icon: Icons.person_rounded),
                        SizedBox(
                          height: 15.h,
                        ),
                        EditUserDataButton(
                            title: "My Favorites",
                            onTap: () {
                              navigatTo(context,
                                  screen: const FavoriteScreen());
                            },
                            icon: Icons.favorite_rounded),
                        SizedBox(
                          height: 15.h,
                        ),
                        EditUserDataButton(
                            title: "Uploaded videos",
                            onTap: () {
                              navigatTo(context, screen: UploadedVideosScreen());

                            },
                            icon: Icons.video_library_rounded),
                        SizedBox(
                          height: 15.h,
                        ),
                        Divider(
                          height: 1.h,
                          color: secondColorDark,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomButton(
                            outLine: true,
                            outlineColor: secondColorDark,
                            textColor: primaryColorDark,
                            onPressed: () {
                              showAlertDialog(context,
                                  title: "Log Out",
                                  content: "Are you sure you want to log out?",
                                  buttonTitle: "Log Out", onTap: () {
                                cubit.logOut();
                                navigatAndReplace(context,
                                    screen: const LoginScreen());
                              });
                            },
                            text: "Log out"),
                        SizedBox(height: 10.h),
                        CustomButton(
                            outLine: true,
                            outlineColor: secondColorDark,
                            textColor: Colors.red.shade900,
                            onPressed: () {
                              showAlertDialog(context,
                                  title: "Delete Account",
                                  content:
                                      "Are you sure you want to delete your account?",
                                  buttonTitle: "Delete Account", onTap: () {
                                cubit.deleteAccount();
                                navigatAndReplace(context,
                                    screen: const LoginScreen());
                              });
                            },
                            text: "Delete Account")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<UserDataModel?> getCachedUserData() async {
    String? userDataJson = PreferenceUtils.instance.getString("userData");
    if (userDataJson != null) {
      return UserDataModel.fromJson(json.decode(userDataJson));
    }
    return null;
  }

  void cacheUserData(UserDataModel userData) async {
    PreferenceUtils.instance.setString('userData', json.encode(userData.toJson()));
  }
}
