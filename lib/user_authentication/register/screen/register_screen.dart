import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/custom_social_media_button.dart';
import 'package:voice_verse/common/app_component/custom_text_form_field.dart';
import 'package:voice_verse/common/app_component/custom_toggle_button.dart';
import 'package:voice_verse/shared/show_alert_dialog.dart';
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

  final cubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocListener<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showAlertDialog(context,
                title: "Success",
                content: "Please check your email and make it active ",
                actions: [
                  CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Close",
                    textColor: primaryColorDark,
                    outLine: true,

                  )
                ]
            );
          }
          else if (state is RegisterFailureState){
            showAlertDialog(context,
                title:  "Register failed",
                content: state.errorMessage,
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text("Close",
                        style: TextStyle(
                            color: primaryColorDark,
                            fontSize: 17,
                            fontWeight: FontWeight.w600
                        ),
                      ))
                ]
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: secondColorDark,
                                  width: 1.5
                              ),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white70,
                              )),
                        ),
                        const SizedBox(width: 15,),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    CustomSocialButton(
                        loginMassage: false,
                        topPadding: 15,
                        onApplePressed: () {},
                        onGmailPressed: () {}),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: secondColorDark,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Or With",
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Divider(
                            color: secondColorDark,
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      topPadding: 10,
                      label: "Name",
                      hintText: " Enter your name",
                      suffixIcon: const Icon(Icons.person_rounded),
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      topPadding: 10,
                      label: "Email",
                      hintText: " Enter your email",
                      suffixIcon: const Icon(Icons.email_rounded),
                    ),
                    CustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        controller: passwordController,
                        topPadding: 10,
                        label: "Password",
                        hintText: " Enter your password",
                        suffixIcon: const Icon(Icons.lock_rounded),
                        obscureText: true
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      controller: confirmPasswordController,
                      topPadding: 10,
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
                    const SizedBox(height: 20),
                    BlocBuilder<RegisterCubit, RegisterStates>(
                      builder: (context, state) {
                        return CustomButton(
                          isLoading: state is RegisterLoadingState ? true: false,
                          onPressed: () {
                            register();
                          },
                          text: "Sign Up",
                        );
                      },
                    ),
                    CustomTextAndButton(
                        moveToLogin: true,
                        onPressed: () {
                          Navigator.pop(context);
                        })

                  ],
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
}
