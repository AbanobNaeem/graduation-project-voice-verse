import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarResult extends StatelessWidget {
  const AvatarResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          "Avatar Screen",
          style: TextStyle(color: Colors.white, fontSize: 24.sp),
        ),
      ),
    );
  }
}
