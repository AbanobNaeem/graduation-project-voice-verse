import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_back_button.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/user_authentication/email_verification/screen/email_verification.dart';
import 'package:voice_verse/user_authentication/forget_password/cubit/forget_password_cubit.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  late bool _buttonEnabled = false;
  final _formKey = GlobalKey<FormState>();
  final cubit = ForgetPasswordCubit();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is SendCodeSuccessState){
            CustomSnackBar.showSuccess(context, title: "Success", message: "Reset password code sent successfully. Check your email!");
            navigatTo(context, screen:  EmailVerification(email: emailController.text,));
          }
          if (state is SendCodeFailureState){
            CustomSnackBar.showError(context,
                message: state.errorMessage,
                title: "Failed");
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding:  EdgeInsets.only(
              top: 20.sp,
              left: 16.sp,
              right: 16.sp,
            ),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const CustomBackButton(title: "Forgot Password"),
                    SizedBox(height: 5.h,),
                    Image.asset(
                      "images/icons/Email campaign-amico.png",
                      width: 60.w,
                    ),
                    SizedBox(height: 2.h,),
                    Text(
                      "Mail Address Here",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                    SizedBox(height: 1.h,),
                    Text(
                      "Please Enter Your Email Address To Receive a Verification Code.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.2.sp),
                    ),
                    SizedBox(height: 3.h,),
                    CustomTextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      hintText: " tirm@gmail.com",
                      onChanged: (value) {
                        _checkButtonEnabled();
                      },
                      validator: (value) {
                        if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        if (!value.endsWith('.com') &&
                            !value.endsWith('.net') &&
                            !value.endsWith('.org')) {
                          return 'Please enter a valid domain (.com, .net, .org)';
                        }

                        return null;
                      },
                      controller: emailController,
                      suffixIcon: const Icon(Icons.email_rounded),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
                      builder: (context, state) {
                        return CustomButton(
                          onPressed: _buttonEnabled ? () async {
                            if (_formKey.currentState!.validate()) {
                              cubit.sendCode(email: emailController.text);
                            }
                          } : null,
                          text: "Recover Password",
                          backGroundColor:
                          _buttonEnabled ? primaryColorDark : secondColorDark,
                          isLoading: state is! SendCodeLoadingState
                              ? false
                              : true,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkButtonEnabled() {
    setState(() {
      _buttonEnabled = emailController.text.isNotEmpty;
    });
  }

}
