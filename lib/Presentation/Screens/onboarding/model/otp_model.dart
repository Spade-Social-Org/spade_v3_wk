class OTPModel {
  final String userId;
  final bool useEmail;
  OTPModel({
    required this.userId,
    required this.useEmail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'useEmail': useEmail,
    };
  }
}
