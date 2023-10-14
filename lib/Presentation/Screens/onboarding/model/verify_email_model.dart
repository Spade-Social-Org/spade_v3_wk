class VerifyEmailModel {
  final String otp;
  VerifyEmailModel({
    required this.otp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'otp': otp,
    };
  }
}

class VerifyEmailResponseModel {
  VerifyEmailResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.devMessage,
  });

  final String? statusCode;
  final VerifyEmailData? data;
  final String? message;
  final String? devMessage;

  factory VerifyEmailResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailResponseModel(
      statusCode: json["statusCode"],
      data:
          json["data"] == null ? null : VerifyEmailData.fromJson(json["data"]),
      message: json["message"],
      devMessage: json["devMessage"],
    );
  }
}

class VerifyEmailData {
  VerifyEmailData({
    required this.userInfo,
    required this.accessToken,
  });

  final UserInfo? userInfo;
  final String? accessToken;

  factory VerifyEmailData.fromJson(Map<String, dynamic> json) {
    return VerifyEmailData(
      userInfo:
          json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
      accessToken: json["accessToken"],
    );
  }
}

class UserInfo {
  UserInfo({
    required this.userId,
  });

  final int? userId;

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json["userId"],
    );
  }
}
