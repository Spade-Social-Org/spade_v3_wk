import 'dart:convert';

import 'package:http/http.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/model/login_model.dart';

class AuthRepository {
  static final client = Client();

  static Future<LoginResponseModel> login(LoginModel model) async {
    var url =
        'https://spade-backend-v3-production.up.railway.app/api/v1/auth/login';
    var response = await client
        .post(Uri.parse(url), body: model.toMap())
        .timeout(const Duration(seconds: 60));
    final data = jsonDecode(response.body);
    return LoginResponseModel.fromJson(data);
  }
}
