import 'response_model.dart';

class LoginModel {
  final String email;
  final String password;
  LoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}

class ResponseModel {
  ResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.devMessage,
  });

  final String? statusCode;
  final ResponseData? data;
  final String? message;
  final String? devMessage;

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      statusCode: json["statusCode"],
      data: json["data"] == null ? null : ResponseData.fromJson(json["data"]),
      message: json["message"],
      devMessage: json["devMessage"],
    );
  }
}
