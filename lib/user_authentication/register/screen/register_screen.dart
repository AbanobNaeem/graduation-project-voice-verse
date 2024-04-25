import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_back_button.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_social_media_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/common/app_component/custom_toggle_button.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/user_authentication/register/cubit/register_cubit.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  late bool obscure = true;

  late bool _buttonEnabled = false;

  final cubit = RegisterCubit();

  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocListener<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            CustomSnackBar.showSuccess(context,
                message: "Activate your email now to access all features!",
                title: "Register Success");
                Navigator.pop(context);
          }
          else if (state is RegisterFailureState){
            CustomSnackBar.showError(context,
                message: state.errorMessage,
                title: "Register Failed");
          }
        },
        child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.only(left:  3.w,right: 3.w, top: 1.h),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBackButton(title: "Sign Up"),
                      SizedBox(height: 1.h,),
                      CustomSocialButton(
                          loginMessage: false,
                          onApplePressed: () {},
                          onGmailPressed: () {}),
                      CustomTextFormField(
                        onChanged: (value){
                          _checkButtonEnabled();
                        },
                        validator:(value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length > 50) {
                            return 'Name must not exceed 50 characters';
                          }
                          return null; // Return null if the input is valid
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        label: "Name",
                        hintText: " Enter your name",
                        suffixIcon: const Icon(Icons.person_rounded),
                      ),
                      SizedBox(height: 1.h,),
                      CustomTextFormField(
                        onChanged: (value){
                          _checkButtonEnabled();
                        },
                        validator: (value) {

                          if (!value.endsWith('.com') && !value.endsWith('.net') && !value.endsWith('.org')) {
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
                      SizedBox(height: 1.h,),
                      CustomTextFormField(
                          onChanged: (value){
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
                            if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return 'Password must contain at least one special character';
                            }
                  
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          controller: passwordController,
                          label: "Password",
                          hintText: " Enter your password",
                          suffixIcon: const Icon(Icons.lock_rounded),
                          obscureText: obscure
                      ),
                      SizedBox(height: 1.h,),
                      CustomTextFormField(
                        onChanged: (value){
                          _checkButtonEnabled();
                        },
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
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        controller: confirmPasswordController,
                        label: "Confirm password",
                        hintText: " Rewrite your password",
                        obscureText: obscure,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: obscure == true ?
                          const Icon(Icons.visibility_rounded) :
                          const Icon(Icons.visibility_off_rounded),
                        ),
                      ),
                      SizedBox(height:2.h,),
                      BlocBuilder<RegisterCubit, RegisterStates>(
                        builder: (context, state) {
                          return CustomButton(
                            backGroundColor:_buttonEnabled ? primaryColorDark: secondColorDark ,
                            isLoading: state is RegisterLoadingState ? true: false,
                            onPressed: _buttonEnabled ? () {
                              if(_formKey.currentState!.validate()){
                                register() ;
                              }
                            }: null,
                            text: "Sign Up",
                          );
                        },
                      ),
                      CustomTextAndButton(
                        moveToLogin: true,
                        onPressed: () {
                          Navigator.pop(context);
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
    // TODO: implement dispose
    super.dispose();
    emailController.clear() ;
    passwordController.clear() ;
    nameController.clear() ;
    confirmPasswordController.clear() ;
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();

  }

  void register() {
    String email = emailController.text ;
    String password  = passwordController.text ;
    String userName = nameController.text;
    String confirmPassword = confirmPasswordController.text;
    cubit.register(
        userName: userName,
        email: email,
        password: password,
        confirmPassword: confirmPassword
    );
  }


  void _checkButtonEnabled() {
    setState(() {
      _buttonEnabled = emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          nameController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }
}

