import 'package:shared_preferences/shared_preferences.dart';
class FirstTime {
  static String isbreased = "isbreased" ;
  static Future<void>  ispres(setpresed) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(isbreased, setpresed);
  }

}