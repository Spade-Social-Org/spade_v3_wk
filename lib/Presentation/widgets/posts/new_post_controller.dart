import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spade_v4/Data/Models/posts/post_model.dart'; 


class NewPostController {
  NewPostController._internal(); // Private constructor, follows Singleton pattern
  static final _instance = NewPostController._internal(); // Singleton instance
  factory NewPostController() =>
      _instance; // Factory constructor to get the instance

  NewPost? _post; // Data for creating a new post

  // Getter methods to access post properties

  String? get description {
    return _post!.description;
  }

  List<File>? get images {
    return _post!.images;
  }

  // Setter methods to update post properties
  set updateDescription(String text) {
    _post!.description = text;
  }

  set addImage(File image) {
    _post!.images ??= [];
    _post!.images!.add(image);
  }

  // Method to remove an image from the post
  void removeImage(int index) {
    _post!.images!.removeAt(index);
  }

  // Method to convert post data into JSON format for HTTP requests
  Future<Map<String, dynamic>> toJson() async {
    List? images;
    if (_post!.images != null) {
      for (File image in _post!.images!) {
        images ??= [];
        images.add(await MultipartFile.fromFile(image.path));
      }
    }

    return {
      "poster_id": _post!.creatorId,
      "post_title": _post!.title,
      "post_body": _post!.description,
      "post_images[]": images,
    };
  }

  // Method to clean up resources and reset the post data
  void dispose() {
    _post = null;
  }
}
