// import 'package:dio/dio.dart';

// class ApiService {
//   ApiService._();

//   static Dio _init() {
//     final _dio = Dio();
//     _dio.options = BaseOptions(
//         baseUrl: ,
//         connectTimeout: ,
//         receiveTimeout: ,
//         sendTimeout: ,
//         headers: {"Authorization":""},
//         );
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onError: (e, handler) {
//           return handler.next(e);
//         },
//         onRequest: (options, handler) {
//           return handler.next(options);
//         },
//         onResponse: (e, handler) {
//           return handler.next(e);
//         },
//       ),
//     );
//     return _dio;
//   }


//   _sfdsdfljbd(){
//     _init().get("",data: );
//   }
// }
