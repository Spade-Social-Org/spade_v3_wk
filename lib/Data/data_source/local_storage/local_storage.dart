import 'dart:async';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static Future<SharedPreferences> _instance() {
    return SharedPreferences.getInstance();
  }

  static Future<void> _storeString(
      {required String key, required String data}) async {
    try {
      (await _instance()).setString(key, data);
    } catch (e) {
      log(e.toString(),
          error: e.runtimeType,
          time: DateTime.now(),
          zone: Zone.current,
          name: "Local_Storage");
      throw "Failed";
    }
  }

  static Future<void> _storeBool(
      {required String key, required bool data}) async {
    try {
      (await _instance()).setBool(key, data);
    } catch (e) {
      log(e.toString(),
          error: e.runtimeType,
          time: DateTime.now(),
          zone: Zone.current,
          name: "Local_Storage");
      throw "Failed";
    }
  }

  static Future<dynamic> _retrieveData(String key) async {
    try {
      return (await _instance()).get(key);
    } catch (e) {
      log(e.toString(),
          error: e.runtimeType,
          time: DateTime.now(),
          zone: Zone.current,
          name: "Local_Storage");
      throw "Failed";
    }
  }

  static Future<void> _removeData(String key) async {
    (await _instance()).remove(key);
  }

  static Future<void> saveToken(String token) async {
    return (await _storeString(key: "token", data: token));
  }

  static Future<String?> retrieveToken() async {
    return await _retrieveData("token");
  }

  static Future<void> deleteToken() async {
    return await _removeData("token");
  }
}
