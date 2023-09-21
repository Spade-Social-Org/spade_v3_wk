// import 'dart:io';

// import 'package:dio/dio.dart';

// import '../../../Data/Models/posts/post_model.dart';
// import '../../../Data/data_source/remote_data_sorce/api2.dart';

// class PostController {
//   PostController._internal();
//   static final _instance = PostController._internal();
//   factory PostController() => _instance;

//   List<Post>? _allPosts;

//   // get addPosts => null;

//   set addPost(Post post) {
//     _allPosts ??= [];
//     _allPosts!.insert(0, post);
//   }

//   set addPosts(List<Post> posts) {
//     _allPosts ??= [];
//     _allPosts!.addAll(posts);
//   }

//   List<Post>? get allPosts {
//     return _allPosts;
//   }
//   void dispose() {
//     _allPosts = null;
//   }
// }

import 'dart:async';
import '../../../Data/Models/posts/post_model.dart';

class PostBloc {
  final _postController = StreamController<List<Post>>();

  List<Post>? _allPosts;

  Stream<List<Post>> get allPostsStream => _postController.stream;

  void addPost(Post post) {
    _allPosts ??= [];
    _allPosts!.insert(0, post);
    _postController.sink.add(_allPosts!);
  }

  void addPosts(List<Post> posts) {
    _allPosts ??= [];
    _allPosts!.addAll(posts);
    _postController.sink.add(_allPosts!);
  }

  void dispose() {
    _postController.close();
  }
}

