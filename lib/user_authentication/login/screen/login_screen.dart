import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_social_media_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/common/app_component/custom_toggle_button.dart';
import 'package:voice_verse/navigation_bar/navigation_bar.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/user_authentication/forget_password/screen/forget_password_screen.dart';
import 'package:voice_verse/user_authentication/login/cubit/login_cubit.dart';
import 'package:voice_verse/user_authentication/register/screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final cubit = LoginCubit();

  late bool _buttonEnabled = false;
  late bool obscurePassword = true;

  void _checkButtonEnabled() {
    setState(() {
      _buttonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocListener<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            navigatAndReplace(context, screen: BottomNavigationBarWidget());
          } else if (state is LoginFailureState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage, title: "Login Failed");
          }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left:  3.w,right: 3.w, top: 1.h),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Image.asset(
                          "images/logo.png",
                          width: 53.w,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      CustomSocialButton(
                        onApplePressed: () {},
                        onGmailPressed: () {},
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFormField(
                        onChanged: (value) {
                          _checkButtonEnabled();
                        },
                        validator: (value) {
                          if (!value.endsWith('.com') &&
                              !value.endsWith('.net') &&
                              !value.endsWith('.org')) {
                            return 'Please enter a valid domain (.com, .net, .org)';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        label: "Email",
                        hintText: " Enter your email",
                        suffixIcon: const Icon(Icons.email_rounded),
                      ),
                      SizedBox(height: 3.h,),
                      CustomTextFormField(
                        onChanged: (value) {
                          _checkButtonEnabled();
                        },
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
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        obscureText: obscurePassword,
                        label: "Password",
                        hintText: " Enter your password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: obscurePassword == true
                              ? const Icon(Icons.visibility_rounded)
                              : const Icon(Icons.visibility_off_rounded),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigatTo(context, screen: ForgetPassword());
                        },
                        child: Text(
                          "Forget your password!",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: primaryColorDark,
                            fontSize:15.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      BlocBuilder<LoginCubit, LoginStates>(
                        builder: (context, state) {
                          return CustomButton(
                            backGroundColor: _buttonEnabled
                                ? primaryColorDark
                                : secondColorDark,
                            isLoading:
                            state is! LoginLoadingState ? false : true,
                            onPressed: _buttonEnabled
                                ? () async {
                              if (_formKey.currentState!.validate()) {
                                cubit.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            }
                                : null,
                            text: "Log In",
                          );
                        },
                      ),
                      CustomTextAndButton(
                        moveToLogin: false,
                        onPressed: () {
                          navigatTo(context, screen: RegisterScreen());
                        },
                      ),
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
