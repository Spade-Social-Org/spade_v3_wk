class RegisterModel {
  RegisterModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.state,
    required this.postalCode,
  });

  final String? email;
  final String? password;
  final String? name;
  final String? phoneNumber;
  final String? country;
  final String? city;
  final String? state;
  final String? postalCode;

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
}
