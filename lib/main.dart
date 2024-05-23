import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/splash_screen.dart';
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
    print(PreferenceUtils.instance.getString(ApiKey.token));
      return ScreenUtilInit(
        designSize:  const Size(360, 640),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                scaffoldBackgroundColor: backGroundColorDark,
                textTheme: GoogleFonts.ralewayTextTheme()),
            home:  const SplashScreen()

        ),
      );
    }

}
