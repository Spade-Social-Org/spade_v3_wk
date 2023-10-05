import 'package:shared_preferences/shared_preferences.dart';

class SaveUserToken {
  static Future saveLoginValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', value);
  }

  static Future saveUserId(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', value);
  }

  static Future saveNameValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nameKey', value);
  }

  static Future saveEmailValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('emailKey', value);
  }
}

class GetUserToken {
  static Future<String?> getLoginValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future saveUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  static Future<String?> getNameValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('nameKey');
  }

  static Future<String?> getEmailValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('emailKey');
  }
}
