import 'dart:developer';
import 'dart:io';

class Post {
  String posterName;
  String? posterImage;
  String description;
  List<String> gallery;
  DateTime createAt;
  int id;

  Post({
    required this.id,
    required this.posterName,
    required this.posterImage,
    required this.gallery,
    required this.description,
    required this.createAt,
  });

static Post fromJson(Map<String, dynamic> json) {
  List<String> gallery = [];
  if (json["gallery"] != null && json["gallery"] is List<dynamic>) {
    gallery = List<String>.from(json["gallery"].map((x) => x as String));
  }
   int id = json['id'] ?? 0;

    return Post(
      id: id,
      createAt: DateTime.parse(json['created_at']),
      posterName: json['poster_name'],
      posterImage: json['poster_image'],
      description: json['description'],
      gallery: gallery,
    );
  }
}

class NewPost {
  String? title;
  String? description;
  List<File>? images;
  int creatorId;

  NewPost({
    required this.creatorId,
    this.title,
    this.description,
    this.images,
  });
}

class ResponsePost {
  final bool resp;
  final String message;
  final List<Post> posts;

  ResponsePost({
    required this.resp,
    required this.message,
    required this.posts,
  });

  factory ResponsePost.fromJson(Map<String, dynamic> json) => ResponsePost(
        resp: json["resp"],
        message: json["message"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );
}
