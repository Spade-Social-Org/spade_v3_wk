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

class LoginResponseModel {
  LoginResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.devMessage,
  });

  final String? statusCode;
  final LoginData? data;
  final String? message;
  final String? devMessage;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      statusCode: json["statusCode"],
      data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
      message: json["message"],
      devMessage: json["devMessage"],
    );
  }
}

class LoginData {
  LoginData({
    required this.userInfo,
    required this.accessToken,
  });

  final UserInfo? userInfo;
  final String? accessToken;

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      userInfo:
          json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
      accessToken: json["accessToken"],
    );
  }
}

class UserInfo {
  UserInfo({
    required this.userId,
    required this.name,
    required this.email,
    required this.verified,
  });

  final int? userId;
  final String? name;
  final String? email;
  final bool? verified;

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json["userId"],
      name: json["name"],
      email: json["email"],
      verified: json["verified"],
    );
  }
}
