import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';


import 'package:spade_v4/Data/data_source/remote_data_sorce/api2.dart';

import '../Models/posts/post_model.dart';

class PostsRepository{
  final options = RequestOptions(
      headers: {
        "accept": "*/*",
        "Content-Type": "multipart/form-data",
        "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExLCJuYW1lIjoiRmF2b3VyIiwiZW1haWwiOiJsZXdlY2hpZ29kc2Zhdm91ckBnbWFpbC5jb20iLCJ2ZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNjk1NzQ5NjE1fQ.SDWv5C12WfkANKIo7UU_yvlLoAlBH-sY5k2itCyNsCI",
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
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExLCJuYW1lIjoiRmF2b3VyIiwiZW1haWwiOiJsZXdlY2hpZ29kc2Zhdm91ckBnbWFpbC5jb20iLCJ2ZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNjk1NzQ5NjE1fQ.SDWv5C12WfkANKIo7UU_yvlLoAlBH-sY5k2itCyNsCI",
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