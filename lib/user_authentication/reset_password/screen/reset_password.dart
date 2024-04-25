import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/user_authentication/login/screen/login_screen.dart';
import 'package:voice_verse/user_authentication/reset_password/cubit/reset_password_cubit.dart';

import '../../../common/app_colors/colors.dart';
import '../../../common/app_component/custom_back_button.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key,
    required this.code
  });
  final String code ;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  late bool obscureText = true;

  final cubit = ResetPasswordCubit();

  late bool _buttonEnabled = false;

  final _formKey = GlobalKey<FormState>();


  void _checkButtonEnabled() {
    setState(() {
      _buttonEnabled = passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocListener<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {
          if (state is ResetPasswordFailureState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage, title: "Failed");
          }
          if (state is ResetPasswordSuccessState) {
          navigatTo(context, screen:const  LoginScreen());
          CustomSnackBar.showSuccess(context,
              message: state.message,
              title: "Success");
    }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: 20.sp,
              left: 15.sp,
              right: 15.sp,
            ),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomBackButton(title: "Reset Password"),
                      Image.asset(
                          "images/icons/Key-rafiki.png",
                          width: 60.sp,
                      ),
                      Text(
                        "Enter new password",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 22.sp),
                      ),
                       SizedBox(height: 15.sp,),
                       Text(
                        "Your new password must be different from previous used password.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp),
                      ),
                       SizedBox(height: 22.sp,),
                      CustomTextFormField(
                          onChanged: (value) {
                            _checkButtonEnabled();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          suffixIcon: const Icon(Icons.lock_rounded),
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
                          label: "Password",
                          hintText: " Write New password",
                          obscureText: true,
                          controller: passwordController),
                      SizedBox(height: 10.sp,),
                      CustomTextFormField(
                        onChanged: (value) {
                          _checkButtonEnabled();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        label: "Confirm password",
                        hintText: " Rewrite your password",
                        controller: confirmPasswordController,
                        obscureText: obscureText,
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
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(obscureText == true
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded)),
                      ),
                      SizedBox(height: 20.sp,),
                      BlocBuilder<ResetPasswordCubit, ResetPasswordStates>(
                        builder: (context, state) {
                          return CustomButton(
                              backGroundColor: _buttonEnabled
                                  ? primaryColorDark
                                  : secondColorDark,
                              isLoading: state is! ResetPasswordLoadingState
                                  ? false
                                  : true,
                              onPressed: _buttonEnabled
                                  ? () async {
                                      if (_formKey.currentState!.validate()) {
                                        cubit.resetPassword(
                                            code:widget.code,
                                            password: passwordController.text,
                                            confirmPassword: confirmPasswordController.text);
                                      }
                                    }
                                  : null,
                              text: "Continue");
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

  @override
  void dispose() {
    super.dispose();
    confirmPasswordController.clear();
    passwordController.clear();
    confirmPasswordController.dispose();
    passwordController.dispose();
  }
}
