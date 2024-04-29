
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/edit_user_data/change_user_data/cubit/change_user_data_cubit.dart';
import 'package:voice_verse/navigation_bar/navigation_bar.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/snack_bar.dart';

class ChangeUserDate extends StatefulWidget {
  ChangeUserDate({super.key,
    required this.isPassword,
    required this.userName ,
  });

  final bool isPassword ;
  final String userName ;

  @override
  State<ChangeUserDate> createState() => _ChangeUserDateState();
}

class _ChangeUserDateState extends State<ChangeUserDate> {
  final TextEditingController currentPasswordController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  final TextEditingController newNameController = TextEditingController();

  final cubit = ChangeUserDataCubit();

  final _formKey = GlobalKey<FormState>();

  late  bool cObscure =  true ;

  late bool pObscure = true ;





  @override
  void dispose() {
    super.dispose();
    passwordController.clear();
    currentPasswordController.clear();
    confirmPasswordController.clear();
    newNameController.clear();
    passwordController.dispose();
    currentPasswordController.dispose();
    confirmPasswordController.dispose();
    newNameController.dispose() ;
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocListener<ChangeUserDataCubit, ChangeUserDataStates>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            CustomSnackBar.showSuccess(context,
                title: "Password Changed ",
                message: "You change your password successfully.");
             Navigator.pop(context);
          }
          if (state is ChangePasswordFailureState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage,
                title: "Failed");
          }
          if (state is ChangeNameSuccessState){
            navigatTo(context,
                screen: BottomNavigationBarWidget(dataUpdated: true,screenIndex: 2,));
          }
          if(state is ChangePasswordFailureState){
            CustomSnackBar.showError(context,
                message: state.errorMessage,
                title: "Failed");
          }
        },
        child: widget.isPassword==true?
        Scaffold(
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
            title:  Text(
              "Edit password",
              style: TextStyle(
                  color: Colors.white60, fontWeight: FontWeight.bold,
                  fontSize: 20.sp
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white60,
                )),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Change your password",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 25.sp),
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        "To change your account password please fill in the fields below",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 20.h,),
                      CustomTextFormField(
                        validator: (value) {
                          // Check if the password meets the minimum length requirement
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                  
                          // Check if the password contains at least one uppercase letter
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Password must contain at least one uppercase letter';
                          }
                  
                          // Check if the password contains at least one lowercase letter
                          if (!value.contains(RegExp(r'[a-z]'))) {
                            return 'Password must contain at least one lowercase letter';
                          }
                  
                          // Check if the password contains at least one digit
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return 'Password must contain at least one digit';
                          }
                  
                          // Check if the password contains at least one special character
                          if (!value
                              .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Password must contain at least one special character';
                          }
                  
                          return null;
                        },
                        label: "Old Password",
                        hintText: " write current password",
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        controller: currentPasswordController,
                        suffixIcon: const Icon(Icons.password_rounded),
                      ),
                      SizedBox(height: 10.h,),
                      CustomTextFormField(
                        validator: (value) {
                          // Check if the password meets the minimum length requirement
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                  
                          // Check if the password contains at least one uppercase letter
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Password must contain at least one uppercase letter';
                          }
                  
                          // Check if the password contains at least one lowercase letter
                          if (!value.contains(RegExp(r'[a-z]'))) {
                            return 'Password must contain at least one lowercase letter';
                          }
                  
                          // Check if the password contains at least one digit
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return 'Password must contain at least one digit';
                          }
                  
                          // Check if the password contains at least one special character
                          if (!value
                              .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Password must contain at least one special character';
                          }
                  
                          return null;
                        },

                        label: "New Password",
                        hintText: " write new password",
                        controller: passwordController,
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            pObscure =! pObscure ;
                          });
                        },
                            icon:pObscure == true ?
                            const Icon(Icons.visibility_rounded):
                            const Icon(Icons.visibility_off_rounded) ),
                        obscureText: pObscure,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 10.h,),
                      CustomTextFormField(

                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          // Check if the password meets the minimum length requirement
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                  
                          // Check if the password contains at least one uppercase letter
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Password must contain at least one uppercase letter';
                          }
                  
                          // Check if the password contains at least one lowercase letter
                          if (!value.contains(RegExp(r'[a-z]'))) {
                            return 'Password must contain at least one lowercase letter';
                          }
                  
                          // Check if the password contains at least one digit
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return 'Password must contain at least one digit';
                          }
                  
                          // Check if the password contains at least one special character
                          if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Password must contain at least one special character';
                          }
                  
                          return null;
                        },
                        label: "Confirm Password",
                        hintText: " Rewrite your password",
                        controller: confirmPasswordController,
                        obscureText: cObscure,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(onPressed:(){
                          setState(() {
                            cObscure =! cObscure ;
                          });
                        }, icon: cObscure == true ?
                        const Icon(Icons.visibility_rounded):
                        const Icon(Icons.visibility_off_rounded)),
                      ),
                      SizedBox(height: 20.h,),
                      BlocBuilder<ChangeUserDataCubit, ChangeUserDataStates>(
                        builder: (context, state) {
                          return CustomButton(
                              backGroundColor:primaryColorDark,
                              isLoading: state is ChangePasswordLoadingState
                                  ? true
                                  : false,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.changePassword(
                                      currentPassword: currentPasswordController.text,
                                      newPassword: passwordController.text,
                                      confirmPassword: confirmPasswordController.text);
                                }
                              } ,
                              text: "Change password");
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ):
        Scaffold(
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
            title:  Text(
              "Edit Name",
              style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white60,
                )),
          ),
          body: Padding(
            padding:  EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                          "images/icons/Resume-rafiki.png",
                        width: 200.sp,
                      ),
                       Text(
                        "Change your Name",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp),
                      ),
                       Text(
                        "Your username needs to be updated Please choose a new one.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp),
                      ),
                      SizedBox(height: 15.h,),
                      CustomTextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length > 50) {
                            return 'Name must not exceed 50 characters';
                          }
                          if(value == widget.userName){
                            return "Please enter a different name" ;
                          }
                          return null; // Return null if the input is valid
                        },
                        label: "New Name",
                        hintText: widget.userName,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        controller: newNameController,
                        suffixIcon: const Icon(Icons.person_rounded),
                      ),
                       SizedBox(height: 20.h,),
                      BlocBuilder<ChangeUserDataCubit, ChangeUserDataStates>(
                        builder: (context, state) {
                          return CustomButton(
                              backGroundColor: primaryColorDark ,
                              isLoading: state is ChangeNameLoadingState ? true : false,
                              onPressed:  () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.changeUserName(newName: newNameController.text);
                                }
                              } ,
                              text: "Change Name");
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),


    );
  }




}
