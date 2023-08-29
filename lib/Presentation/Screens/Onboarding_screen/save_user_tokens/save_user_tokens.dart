import 'package:shared_preferences/shared_preferences.dart';

class SaveUserToken {
  static Future saveLoginValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loginKey', value);
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
  static Future<bool?> getLoginValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loginKey');
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
