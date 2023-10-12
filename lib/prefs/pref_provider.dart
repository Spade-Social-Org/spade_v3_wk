import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final userAuthChange = Provider((ref) => PrefProvider.getUserToken());

class PrefProvider {
  static const _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static String userId = 'userId';
  static String token = 'token';

  static Future<void> saveUserToken(String value) async {
    await _storage.write(key: token, value: value);
  }

  static Future saveUserId(int value) async {
    await _storage.write(key: userId, value: "$value");
  }

  static Future<String?> getUserToken() async {
    return await _storage.read(key: token) ?? '';
  }

  static Future getUserId() async {
    return await _storage.read(key: userId) ?? '';
  }
}
