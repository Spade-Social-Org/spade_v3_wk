import 'dart:convert';

import 'package:flutter/services.dart';

class AppUtils {
  Future<List<PhonenumberModel>> loadCountryCodes() async {
    var res = await rootBundle.loadString('assets/others/CountryCodes.json');
    var result = jsonDecode(res) as List<dynamic>;
    return result.map((e) => PhonenumberModel.fromJson(e)).toList();
  }
}

PhonenumberModel countriedModelFromJson(String str) =>
    PhonenumberModel.fromJson(json.decode(str));

String countriedModelToJson(PhonenumberModel data) =>
    json.encode(data.toJson());

class PhonenumberModel {
  PhonenumberModel({
    this.name,
    this.dialCode,
    this.code,
  });

  String? name;
  String? dialCode;
  String? code;

  factory PhonenumberModel.fromJson(Map<String, dynamic> json) =>
      PhonenumberModel(
        name: json['name'],
        dialCode: json['dial_code'],
        code: json['code'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'dial_code': dialCode,
        'code': code,
      };

  @override
  String toString() {
    return 'PhonenumberModel{name: $name, dialCode: $dialCode, code: $code}';
  }
}
