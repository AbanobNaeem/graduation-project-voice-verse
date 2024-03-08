import 'package:flutter/material.dart';

class CustomTextAndButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool moveToLogin ;

  const CustomTextAndButton({
    required this.onPressed,
    this.moveToLogin = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
           moveToLogin == false ?
            "Don't have an account?":
            "Already have an account?",
            style: const TextStyle(color: Colors.white60),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              moveToLogin ==false ?
              "Sign Up":
              "Log In",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
