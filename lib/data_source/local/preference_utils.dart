import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static late final SharedPreferences instance;
  static PreferenceUtils get() => PreferenceUtils();
  static Future init() async {
    instance = await SharedPreferences.getInstance();
  }
}