import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/splash_screen.dart';
import 'package:voice_verse/user_authentication/login/cubit/login_cubit.dart';
import 'data_source/local/preference_utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: backGroundColorDark,
      statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PreferenceUtils.instance.clear();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            scaffoldBackgroundColor: backGroundColorDark,
            textTheme: GoogleFonts.ralewayTextTheme()),
        home: SplashScreen());
  }
}
