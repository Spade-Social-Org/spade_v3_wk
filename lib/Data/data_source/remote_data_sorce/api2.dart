import 'package:dio/dio.dart';

class ApiService {
  ApiService._();

  static Dio _init() {
    final _dio = Dio();
    _dio.options = BaseOptions(
        baseUrl: "https://spade-social.onrender.com",
        connectTimeout: const Duration(seconds: 40),
        receiveTimeout: const Duration(seconds: 40),
        sendTimeout: const Duration(seconds: 40),
        headers: {"Authorization":""},
        );
    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onError: (e, handler) {
    //       return handler.next(e);
    //     },
    //     onRequest: (options, handler) {
    //       return handler.next(options);
    //     },
    //     onResponse: (e, handler) {
    //       return handler.next(e);
    //     },
    //   ),
    // );
    return _dio;
  }


 static Future<dynamic> _get(String path){
    return _init().get(path);
}


  static Future<dynamic> _post(String path, FormData payload){
    return _init().post(path, data: payload);
}

static Future<dynamic> createPost(FormData payload) async{
    final response = await _post("/api/v1/posts", payload);
    return response.data;
    
}
}
