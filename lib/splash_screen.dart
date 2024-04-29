import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/navigation_bar/navigation_bar.dart';
import 'package:voice_verse/shared/navigation.dart';
import 'package:voice_verse/user_authentication/login/screen/login_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    Future.delayed( const Duration(milliseconds: 2000), () {
      final token = PreferenceUtils.instance.getString(ApiKey.token) ;
      if( token != null){
        navigatAndReplace(context,
            screen: BottomNavigationBarWidget());
      }
      else{
        navigatAndReplace(context,
            screen: const LoginScreen());
      }
     });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FadeTransition(
            opacity: _animation,
            child: Center(
              child: Image.asset(
                "images/logo.png",
                width: 250.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }


}