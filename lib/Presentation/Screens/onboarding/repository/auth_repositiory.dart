import 'dart:convert';

import 'package:http/http.dart';
import 'package:spade_v4/Common/api.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/model/login_model.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/model/otp_model.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/model/register_model.dart';

class AuthRepository {
  static final client = Client();

  static Future<ResponseModel> login(LoginModel model) async {
    var response = await client
        .post(Uri.parse("${baseUrl}auth/login"), body: model.toMap())
        .timeout(const Duration(seconds: 60));
    final data = jsonDecode(response.body);
    return ResponseModel.fromJson(data);
  }

  static Future<ResponseModel> register(RegisterModel model) async {
    var response = await client
        .post(Uri.parse("${baseUrl}auth/signup"), body: model.toJson())
        .timeout(const Duration(seconds: 60));
    final data = jsonDecode(response.body);
    return ResponseModel.fromJson(data);
  }

  static Future<ResponseModel> sendOTP(OTPModel model) async {
    var response = await client
        .post(Uri.parse("${baseUrl}auth/otp/send"), body: model.toMap())
        .timeout(const Duration(seconds: 60));
    final data = jsonDecode(response.body);
    return ResponseModel.fromJson(data);
  }

  static Future<ResponseModel> verifyOTP(String otp) async {
    var response = await client.post(Uri.parse("${baseUrl}auth/otp/verify"),
        body: {'otp': otp}).timeout(const Duration(seconds: 60));
    final data = jsonDecode(response.body);
    return ResponseModel.fromJson(data);
  }
}
