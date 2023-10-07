import 'dart:async';
import 'dart:developer';


import 'package:dio/dio.dart';


import '../Models/posts/post_model.dart';

class PostsRepository{
  final options = RequestOptions(
      headers: {
        "accept": "*/*",
        "Content-Type": "multipart/form-data",
        "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExLCJuYW1lIjoiRmF2b3VyIiwiZW1haWwiOiJsZXdlY2hpZ29kc2Zhdm91ckBnbWFpbC5jb20iLCJ2ZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNjk2Njk0NjIyfQ.meMywVSRn6lxA0IEwcibYXOhgynAeCGvTexiM2JzT58",
      }
      );

  static Future<Dio> _init() async {
    // String? token;
    // token = await LocalStorage.retrieveToken();
    final dio = Dio();
    dio.options = BaseOptions(
        baseUrl: "https://spade-backend-v3-production.up.railway.app",
        connectTimeout: const Duration(seconds: 1000),
        receiveTimeout: const Duration(seconds: 100),
        sendTimeout: const Duration(seconds: 100),
        headers: {
          "accept": "*/*",
          "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExLCJuYW1lIjoiRmF2b3VyIiwiZW1haWwiOiJsZXdlY2hpZ29kc2Zhdm91ckBnbWFpbC5jb20iLCJ2ZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNjk2Njk0NjIyfQ.meMywVSRn6lxA0IEwcibYXOhgynAeCGvTexiM2JzT58",
        });
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          log(options.headers.toString());
          log(options.baseUrl + options.path);
          // log((options.data as FormData?)?.fields.toString());
          // log((options.data as FormData?)?.files.toString());
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // log('checking:${response.data['data']}');
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          log(e.response.toString(),
              error: e.runtimeType,
              time: DateTime.now(),
              zone: Zone.current,
              name: e.message.toString());
          log(e.toString());
          return handler.next(e);
        },
      ),
    );
    return dio;
  }

  static Future<Response> _get(String path) async {
    return (await _init()).get(path);
  }


  Future<List<Post>> fetchPosts(int page ,  {int lastPostId = 0}) async {
    try {
    final response = await _get('/api/v1/posts/user/feeds?pageSize=15&page=$page');

    if (response.statusCode == 200) {
      // print("hi: $response");

      final List<dynamic> data = response.data['data'];
      // print("hggi: ${response.data}");

      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  } catch (e) {
  throw Exception('Failed to fetch posts: $e');
  }
  }
}