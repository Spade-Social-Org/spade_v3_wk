class RegisterModel {
  final String? email;
  final String? password;
  final String? name;
  final String? phoneNumber;
  final String? country;
  final String? city;
  final String? state;
  final String? postalCode;
  RegisterModel({
    this.email,
    this.password,
    this.name,
    this.phoneNumber,
    this.country,
    this.city,
    this.state,
    this.postalCode,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "phone_number": phoneNumber,
        "country": country,
        "city": city,
        "state": state,
        "postal_code": postalCode,
      };

  @override
  String toString() {
    return 'RegisterModel(email: $email, password: $password, name: $name, phoneNumber: $phoneNumber, country: $country, city: $city, state: $state, postalCode: $postalCode)';
  }
}

class RegisterResponseModel {
  RegisterResponseModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.devMessage,
  });

  final String? statusCode;
  final RegisterData? data;
  final String? message;
  final String? devMessage;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      statusCode: json["statusCode"],
      data: json["data"] == null ? null : RegisterData.fromJson(json["data"]),
      message: json["message"],
      devMessage: json["devMessage"],
    );
  }
}

class RegisterData {
  RegisterData({
    required this.userId,
    required this.name,
    required this.email,
  });

  final int? userId;
  final String? name;
  final String? email;

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      userId: json["userId"],
      name: json["name"],
      email: json["email"],
    );
  }
}
