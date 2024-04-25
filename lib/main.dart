import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/favorite_screen/screen/favourites_screen.dart';
import 'package:voice_verse/splash_screen.dart';
import 'package:voice_verse/upload_video/screen/upload_video.dart';
import 'data_source/local/preference_utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: backGroundColorDark,
      statusBarColor: Colors.transparent));

  // runApp(DevicePreview(
  //     enabled: !kReleaseMode ,
  //     builder: (context)=>MyApp()));
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(PreferenceUtils.instance.getString(ApiKey.token));
    return ResponsiveSizer(builder: (p0,p1,p2){
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              scaffoldBackgroundColor: backGroundColorDark,
              textTheme: GoogleFonts.ralewayTextTheme()),
          home: SplashScreen());
    });

  }
}
