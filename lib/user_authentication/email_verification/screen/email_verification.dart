import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_back_button.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_toggle_button.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/user_authentication/email_verification/cubit/email_verification_cubit.dart';
import 'package:voice_verse/user_authentication/forget_password/cubit/forget_password_cubit.dart';
import 'package:voice_verse/user_authentication/reset_password/screen/reset_password.dart';

class EmailVerification extends StatefulWidget {
  EmailVerification({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  OtpFieldController otpController = OtpFieldController();

  final cubit = EmailVerificationCubit();

  late String otpValue = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<EmailVerificationCubit, EmailVerificationStates>(
        listener: (context, state) {
          if (state is CodeFalseState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage, title: 'Failed');
          }
          if (state is CodeTrueState) {
            navigatTo(context,
                screen: ResetPassword(
                  code: otpValue,
                ));
          }
          if(state is ReSendCodeSuccessState){
            CustomSnackBar.showSuccess(
                context, title: "Success", message: "Reset password code resent successfully. Check your email!");
          }
          if(state is ReSendCodeFailureState){
            CustomSnackBar.showError(context,
                message: "oops! try again!", title: "Failed");
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              left: 10.w,
              right: 10.w,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  CustomBackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: "Email Verification"),
                  SizedBox(
                    height: 15.h,
                  ),
                  Image.asset(
                    "images/icons/Enter OTP-amico.png",
                    width: 200.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Please enter 5 digit code that send to ${widget.email}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                  OTPTextField(
                    controller: otpController,
                    length: 5,
                    onChanged: (String value) {
                      setState(() {
                        otpValue = value;
                      });
                    },
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50.w,
                    fieldStyle: FieldStyle.underline,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.transparent,
                      enabledBorderColor: secondColorDark,
                      focusBorderColor: primaryColorDark,
                    ),
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextAndButton(
                    onPressed: () {
                      cubit.reSendCode(email: widget.email);
                    },
                    isTitle: true,
                    message: "If your code missed, tap to ",
                    buttonTitle: "Resend",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder<EmailVerificationCubit, EmailVerificationStates>(
                    builder: (context, state) {
                      return CustomButton(
                          onPressed: () {
                            cubit.checkCode(code: otpValue);
                          },
                          isLoading:
                              state is! CheckCodeLoadingState ? false : true,
                          text: "Verify and Proceed");
                    },
                  )
                ],
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
  }
}
