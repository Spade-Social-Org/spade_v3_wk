class ResponseData {
  ResponseData({
    required this.userInfo,
    required this.accessToken,
  });

  final UserInfo? userInfo;
  final String? accessToken;

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
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
