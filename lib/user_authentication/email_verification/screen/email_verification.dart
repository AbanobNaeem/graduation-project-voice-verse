import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
  final cubit2 = ForgetPasswordCubit();

  late String otpValue = "";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => cubit,
        ),
        BlocProvider(
          create: (_) => cubit2,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<EmailVerificationCubit, EmailVerificationStates>(
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
            },
          ),
          BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
            listener: (context, state) {
              if (state is ReSendCodeSuccessState){
                CustomSnackBar.showSuccess(
                    context, title: "Success",
                    message: "the code resend successful. check your email!");
              }
              if(state is ReSendCodeFailureState){
                CustomSnackBar.showError(context,
                    message: "an error occurred!, please tap resend again ",
                    title: "Failed");
              }
            },
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.only(
              top: 20.sp,
              left: 16.sp,
              right: 16.sp,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const CustomBackButton(title: "Email Verification"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Image.asset(
                    "images/icons/Enter OTP-amico.png",
                    width: 55.sp,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Get your code",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 22.sp),
                  ),
                  SizedBox(
                    height: 17.sp,
                  ),
                  Text(
                    "Please enter 5 digit code that send to ${widget.email}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                  ),
                  SizedBox(height: 27.sp),
                  OTPTextField(
                    controller: otpController,
                    length: 5,
                    onChanged: (String? value) {
                      if (value?.length == 5) {
                        setState(() {
                          otpValue = value!;
                        });
                      }
                    },
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 30.sp,
                    fieldStyle: FieldStyle.underline,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.transparent,
                      enabledBorderColor: secondColorDark,
                      focusBorderColor: primaryColorDark,
                    ),
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  CustomTextAndButton(
                    onPressed: () {
                      cubit2.sendCode(email: widget.email);
                    },
                    isTitle: true,
                    message: "If your code missed, tap to ",
                    buttonTitle: "Resend",
                  ),
                  SizedBox(
                    height: 27.sp,
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
