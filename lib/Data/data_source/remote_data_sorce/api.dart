// import 'package:dio/dio.dart';
// import 'dart:io';

// class ApiProvider {
//   final Dio _dio = Dio();

//   Future<void> uploadMedia(String filePath) async {
//     try {
//       FormData formData = FormData.fromMap({
//         'media': await MultipartFile.fromFile(filePath),
//       });

//       await _dio.post('https://your-upload-api-url.com/upload', data: formData);
//     } catch (e) {
//       print('Upload error: $e');
//       throw e; // Rethrow the error for UI handling
//     }
//   }

//   Future<String> fetchMediaUrl(String mediaId) async {
//     try {
//       final response = await _dio.get('https://your-fetch-api-url.com/media/$mediaId');
//       return response.data['mediaUrl'] as String;
//     } catch (e) {
//       print('Fetch error: $e');
//       throw e; // Rethrow the error for UI handling
//     }
//   }
// }


