// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String username;
  final String profileImageUrl;

  User(this.id, this.username, this.profileImageUrl);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id'] as String,
      map['username'] as String,
      map['profileImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
