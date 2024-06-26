import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_back_button.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/user_authentication/email_verification/screen/email_verification.dart';
import 'package:voice_verse/user_authentication/forget_password/cubit/forget_password_cubit.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

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
              top: 10.h,
              left: 10.w,
              right: 10.w,
            ),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomBackButton(
                        onPressed: (){Navigator.pop(context);},
                        title: "Forgot Password"),
                    SizedBox(height: 15.h,),
                    Image.asset(
                      "images/icons/Email campaign-amico.png",
                      width: 200.w,
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "Mail Address Here",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 27.sp),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      "Please Enter Your Email Address To Receive a Verification Code.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.w500,
                          fontSize: 19.sp),
                    ),
                    SizedBox(height: 10.h,),
                    CustomTextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      hintText: " tirm@gmail.com",
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
