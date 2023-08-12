// // import 'package:dio/dio.dart';
// // import 'dart:io';

// // class ApiProvider {
// //   final Dio _dio = Dio();

// //   Future<void> uploadMedia(String filePath) async {
// //     try {
// //       FormData formData = FormData.fromMap({
// //         'media': await MultipartFile.fromFile(filePath),
// //       });

// //       await _dio.post('https://your-upload-api-url.com/upload', data: formData);
// //     } catch (e) {
// //       print('Upload error: $e');
// //       throw e; // Rethrow the error for UI handling
// //     }
// //   }

// //   Future<String> fetchMediaUrl(String mediaId) async {
// //     try {
// //       final response = await _dio.get('https://your-fetch-api-url.com/media/$mediaId');
// //       return response.data['mediaUrl'] as String;
// //     } catch (e) {
// //       print('Fetch error: $e');
// //       throw e; // Rethrow the error for UI handling
// //     }
// //   }
// // }

// import 'dart:html';

// import 'package:dio/dio.dart';

// import 'api2.dart';

// Future<void> createPost() async {
//     try {
//       final payload = FormData.fromMap(await _newPostController.toJson());
//       final ref = await ApiService.createPost(payload);
//       _postController.addPost = Post.fromJson(ref.data["data"]);
//       notifyListeners();
//     } on DioException catch (e) {
//       if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
//         log(e.toString(), error: e.runtimeType, time: DateTime.now(), zone: Zone.current);
//         throw "request time-out";
//       }
//       log(e.response.toString(), error: e.runtimeType, time: DateTime.now(), zone: Zone.current, name: "Channel_Provider - createPost");
//       log(e.error.toString());
//       log(e.message.toString());
//       throw e.response?.data["message"];
//     } catch (e) {
//       log(e.toString(), error: e.runtimeType, time: DateTime.now(), zone: Zone.current, name: "Channel_Provider - createPost");
//       throw "An error occured";
//     }
//   }
