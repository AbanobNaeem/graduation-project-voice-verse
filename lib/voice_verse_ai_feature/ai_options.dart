import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_component/ai_model_button.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/models/user_data_model.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/user_profile/cubit/user_profile_cubit.dart';
import 'package:voice_verse/voice_verse_ai_feature/avatar/screen/avatar_ai_model.dart';
import 'package:voice_verse/voice_verse_ai_feature/cloning/screen/cloning_ai_model.dart';
import 'package:voice_verse/voice_verse_ai_feature/dubbing/screen/dubbing_ai_model.dart';
import '../common/app_colors/colors.dart';

class AiOptions extends StatefulWidget {
  AiOptions({Key? key}) : super(key: key);

  @override
  State<AiOptions> createState() => _AiOptionsState();
}

class _AiOptionsState extends State<AiOptions> {
  final cubit = UserProfileCubit();
  UserDataModel? userData;

  @override
  void initState() {
    super.initState();
    _initializeUserData();
  }

  Future<void> _initializeUserData() async {
    UserDataModel? cachedUserData = await getCachedUserData();
    if (cachedUserData == null || cachedUserData.result?.userName == null) {
      cubit.getUserData();
    } else {
      setState(() {
        userData = cachedUserData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<UserProfileCubit, UserProfileStates>(
        listener: (context, state) {
          if (state is GetDataSuccessState) {
            setState(() {
              userData = state.user;
            });
            cacheUserData(state.user);
          }
        },
        child: Container(
          width: double.infinity,
          height: 350.h, // Adjust the height as needed
          decoration: const BoxDecoration(
            color: backGroundColorDark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: secondColorDark,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Hi, ${getUserName()}!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h,),
                Text(
                  "What are you up to today?",
                  style: TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 20.h,),
                AiModelButton(
                    iconData: Icons.perm_media_rounded,
                    text: "Avatar",
                    onTap: () {
                      Navigator.pop(context);
                      navigatTo(context, screen: AvatarAiModel());
                    }),
                SizedBox(height: 20.h,),
                AiModelButton(
                    iconData: Icons.cached_rounded,
                    text: "Cloning",
                    onTap: () {
                      Navigator.pop(context);
                      navigatTo(context, screen: const CreateCloningScreen());
                    }),
                SizedBox(height: 20.h,),
                AiModelButton(
                    iconData: Icons.translate_rounded,
                    text: "Dubbing",
                    onTap: () {
                      Navigator.pop(context);
                      navigatTo(context, screen: const CreateDubbingScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserDataModel?> getCachedUserData() async {
    String? userDataJson = PreferenceUtils.instance.getString("userData");
    if (userDataJson != null) {
      return UserDataModel.fromJson(jsonDecode(userDataJson));
    }
    return null;
  }

  void cacheUserData(UserDataModel userData) {
    PreferenceUtils.instance.setString("userData", jsonEncode(userData.toJson()));
  }

  String? getUserName() {
    return userData?.result?.userName ?? 'User';
  }
}
