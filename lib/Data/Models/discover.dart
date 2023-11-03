import 'package:flutter/material.dart';

class DiscoverModel {
  final String name;
  final Color color;
  final String urlImg;
  final String age;
  final String country;
  final String percentage;

  DiscoverModel(this.name, this.color, this.urlImg, this.age, this.country,
      this.percentage);
}

class DiscoverUserModel {
  List<String>? gallery;
  int? userid;
  String? name;
  int? id;
  String? createdAt;
  String? updatedAt;
  String? gender;
  String? relationshipType;
  int? minAge;
  int? maxAge;
  String? hobbies;
  dynamic userId;
  String? radius;
  String? genderPreference;
  dynamic tag;
  String? religion;
  String? bodyType;
  int? height;
  String? ethnicity;
  String? longitude;
  String? latitude;
  bool? shareLocation;
  String? dob;
  String? country;
  String? age;
  double? distance;

  DiscoverUserModel(
      {this.gallery,
      this.userid,
      this.name,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.gender,
      this.relationshipType,
      this.minAge,
      this.maxAge,
      this.hobbies,
      this.userId,
      this.radius,
      this.genderPreference,
      this.tag,
      this.religion,
      this.bodyType,
      this.height,
      this.ethnicity,
      this.longitude,
      this.latitude,
      this.shareLocation,
      this.dob,
      this.country,
      this.age,
      this.distance});

  factory DiscoverUserModel.fromJson(Map<String, dynamic> json) {
    return DiscoverUserModel(
      gallery: json['gallery']?.cast<String>(),
      userid: json['userid'],
      name: json['name'],
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      gender: json['gender'],
      relationshipType: json['relationship_type'],
      minAge: json['min_age'],
      maxAge: json['max_age'],
      hobbies: json['hobbies'],
      userId: json['user_id'],
      radius: json['radius'],
      genderPreference: json['gender_preference'],
      tag: json['tag'],
      religion: json['religion'],
      bodyType: json['body_type'],
      height: json['height'],
      ethnicity: json['ethnicity'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      shareLocation: json['share_location'],
      dob: json['dob'],
      country: json['country'],
      age: json['age'],
      distance: json['distance'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gallery'] = gallery;
    data['userid'] = userid;
    data['name'] = name;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['gender'] = gender;
    data['relationship_type'] = relationshipType;
    data['min_age'] = minAge;
    data['max_age'] = maxAge;
    data['hobbies'] = hobbies;
    data['user_id'] = userId;
    data['radius'] = radius;
    data['gender_preference'] = genderPreference;
    data['tag'] = tag;
    data['religion'] = religion;
    data['body_type'] = bodyType;
    data['height'] = height;
    data['ethnicity'] = ethnicity;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['share_location'] = shareLocation;
    data['dob'] = dob;
    data['country'] = country;
    data['age'] = age;
    data['distance'] = distance;
    return data;
  }

  @override
  String toString() {
    return 'DiscoverUserModel{'
        'gallery: $gallery, '
        'userid: $userid, '
        'name: $name, '
        'id: $id, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'gender: $gender, '
        'relationshipType: $relationshipType, '
        'minAge: $minAge, '
        'maxAge: $maxAge, '
        'hobbies: $hobbies, '
        'userId: $userId, '
        'radius: $radius, '
        'genderPreference: $genderPreference, '
        'tag: $tag, '
        'religion: $religion, '
        'bodyType: $bodyType, '
        'height: $height, '
        'ethnicity: $ethnicity, '
        'longitude: $longitude, '
        'latitude: $latitude, '
        'shareLocation: $shareLocation, '
        'dob: $dob, '
        'country: $country, '
        'age: $age, '
        'distance: $distance}';
  }
}
