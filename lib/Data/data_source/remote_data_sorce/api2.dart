// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:spade_v4/Data/Models/posts/post_model.dart';

// class ApiService {
//   ApiService._();

//   static Dio _init() {
//     final _dio = Dio();
//     _dio.options = BaseOptions(
//       baseUrl: "https://spade-social.onrender.com",
//       connectTimeout: const Duration(seconds: 40),
//       receiveTimeout: const Duration(seconds: 40),
//       sendTimeout: const Duration(seconds: 40),
//       headers: {
//         "accept": "*/*",
//         "Content-Type": "multipart/form-data",
//         "Authorization":
//             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExLCJuYW1lIjoiRmF2b3VyIiwiZW1haWwiOiJsZXdlY2hpZ29kc2Zhdm91ckBnbWFpbC5jb20iLCJpYXQiOjE2OTI0NTI2OTl9.asYxoX88DAVeT4-B0sZ23SUm0FCkCVEOCgKReHA5koY'
//       },
//     );
//     return _dio;
//   }

//   static Future<dynamic> _get(String path) {
//     return _init().get(path);
//   }

//   // static Future<dynamic> _post(String path, FormData payload) {
//   //   return _init().post(path, data: payload);
//   // }

//   static Future<dynamic> _post(String path, FormData payload) async {
//     try {
//       final response = await _init().post(path, data: payload);

//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         // Handle non-200 status codes here
//         print("Request failed with status code ${response.statusCode}");
//         return null;
//       }
//     } catch (error) {
//       // Handle network errors here
//       print("Network error: $error");
//       return null;
//     }
//   }

//   static Future<void> createPost3(File file) async {
//     String fileName = file.path.split('/').last;
//     FormData formData = FormData.fromMap({
//       'description': 'smaple',
//       'is_story': false,
//       'files': await MultipartFile.fromFile(
//         file.path,
//         filename: fileName,
//       ),
//     });
//     var response = await _post("/api/v1/posts", formData);
//     log(response.toString());
//     log(response.data.toString());
//     // return response.data;
//   }
// }

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:spade_v4/Data/Models/story/story_view_model.dart';
import 'package:spade_v4/Presentation/widgets/story/story_controller.dart';

import '../../../Presentation/widgets/posts/post_controller.dart';
import '../../Models/posts/post_model.dart';

class ApiService {
  ApiService._();

  static Future<Dio> _init() async {
    // String? token;
    // token = await LocalStorage.retrieveToken();
    final dio = Dio();
    dio.options = BaseOptions(
        baseUrl: "https://spade-backend-v3-production.up.railway.app",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {
          "accept": "*/*",
          "Content-Type": "multipart/form-data",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExLCJuYW1lIjoiRmF2b3VyIiwiZW1haWwiOiJsZXdlY2hpZ29kc2Zhdm91ckBnbWFpbC5jb20iLCJ2ZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNjk0NTk0NzQ0fQ.dJNUvrlt1iCIgcP0cSuCf9rJUsnrasAD-d6FPqEXa8I",
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
          log(response.toString());
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

  static Future<Response> _post(String path, FormData payload) async {
    return (await _init()).post(path, data: payload);
  }

  static Future<Response> createPost3(File file) async {
    String fileName = file.path.split('/').last;
    log(file.path);
    FormData formData = FormData.fromMap({
      'description': 'sample1',
      'is_story': false,
      'files': MultipartFile.fromFileSync(file.path,
          filename: fileName, contentType: MediaType("image", "jpg")),
    });
    return await _post("/api/v1/posts", formData);
  }

  static Future<Response> createStory3(File file) async {
    String fileName = file.path.split('/').last;
    log(file.path);
    FormData formData = FormData.fromMap({
      'description': 'sample2',
      'is_story': true,
      'files': MultipartFile.fromFileSync(file.path,
          filename: fileName, contentType: MediaType("image", "jpg")),
    });
    return await _post("/api/v1/posts", formData);
  }

  static Future<void> createAndDisplayPost(File file) async {
    try {
      print('error10');
      Response response = await ApiService.createPost3(file);
      print('error11');
      if (response.statusCode == 200) {
        print('error12');
        Map<String, dynamic> responseData = response.data;
        print('error13');
        Post post = Post.fromJson(responseData);
        print('error14');
        // addPost = post;
        PostController().addPost = post;
        print('error15');
      } else {
        print("Error creating post: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error creating post: $e");
    }
  }

  static Future<void> getAllPost() async {
    print('error');
    try {
      final response = await _get("/api/v1/posts/user/feeds?is_story=false");
      print('error2');
      final List<dynamic> responseData = response.data["data"];
      print('error3');
      final List<Post> posts =
          responseData.map((data) => Post.fromJson(data)).toList();
      print('error4');
      log(posts.toString());
      print('error5');
      final postController = PostController();
      print('error6');
      postController.addPosts = posts;
      print('error7');
      return;
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }

  static Future<void> getAllStories() async {
    try {
      final response = await _get("/api/v1/posts/user/feeds?is_story=true");
      final List<dynamic> responseData = response.data["data"];
      final List<Storyy> storyy =
          responseData.map((data) => Storyy.fromJson(data)).toList();
      log(storyy.toString());
      final storyController = StoryController();
      storyController.addStorys = storyy;
      return;
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }

  // static Future<void> getAllPost(Map<String, int?>? payload) async {
  //   return await _get("/api/v1/posts",);
  // }
}
//   static Future<void> createPostWithImages(List<File> imageFiles) async {
//   try {
//     List<MultipartFile> formDataFiles = [];

//     // Iterate through the list of image files and add them to the formDataFiles list
//     for (File file in imageFiles) {
//       String fileName = file.path.split('/').last;
//       String mimeType = 'image';

//       if (fileName.toLowerCase().endsWith('.jpg') ||
//           fileName.toLowerCase().endsWith('.jpeg')) {
//         mimeType += '/jpeg';
//       } else if (fileName.toLowerCase().endsWith('.png')) {
//         mimeType += '/png';
//       } else {
//         // Handle unsupported image formats if needed
//         log('Unsupported image format: $fileName');
//         continue;
//       }

//       // Add the image file to the list of files
//       formDataFiles.add(
//         MultipartFile.fromFileSync(
//           file.path,
//           filename: fileName,
//           contentType:MediaType("image", fileName.split(".").last),
//         ),
//       );
//     }

//     // Create the FormData with all image files
//     FormData formData = FormData.fromMap({
//       'description': 'sample',
//       'is_story': false,
//       'files': formDataFiles,
//     });

//     var response = await _post("/api/v1/posts", formData);

//     if (response != null) {
//       log(response.toString());
//       log(response.data.toString());
//     } else {
//       // Handle the case where the response is null
//       log("Response is null");
//     }
//   } catch (error) {
//     // Handle any unhandled exceptions
//     log("Error: $error");
//   }
// }

// }

// class ApiService {
//   ApiService._();

//   static Future<Dio> _formdataInstance() async {
//     String? token;
//     token = await LocalStorage.retrieveToken();
//     final dio = Dio();

//     dio.options = BaseOptions(
//         baseUrl: "https://spade-social.onrender.com",
//         responseType: ResponseType.json,
//         connectTimeout: const Duration(seconds: 40),
//         receiveTimeout: const Duration(seconds: 30),
//         sendTimeout: const Duration(seconds: 40),
//         headers: {
//           "Authorization": "Bearer $token",
//           "Content-Type": "multipart/form-data",
//           "accept": "*/*"
//         });
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
//           log(options.headers.toString());
//           log(options.baseUrl + options.path);
//           log((options.data as FormData).fields.toString());
//           log((options.data as FormData).files.toString());
//           return handler.next(options);
//         },
//         onResponse: (Response response, ResponseInterceptorHandler handler) {
//           log(response.toString());
//           return handler.next(response);
//         },
//         onError: (DioException e, ErrorInterceptorHandler handler) {
//           log(e.response.toString(),
//               error: e.runtimeType,
//               time: DateTime.now(),
//               zone: Zone.current,
//               name: e.message.toString());
//           log(e.toString());
//           return handler.next(e);
//         },
//       ),
//     );
//     return dio;
//   }

//   static Future<Response> createPost(FormData payload) async {
//      try {
//       String fileName = file.path.split('/').last;
//       log(file.path);
//       FormData formData = FormData.fromMap({
//         'description': 'sample',
//         'is_story': false,
//         'files': MultipartFile.fromFileSync (
//           file.path,
//           filename: fileName,
//           contentType:  MediaType("image", "jpeg")),

//       }

//       );

//       var response = await _post("/api/v1/posts", formData);
//   //   static Future<dynamic> _post(String path, FormData payload) async {
// //     try {
// //       final response = await _init().post(path, data: payload);

// //       if (response.statusCode == 200) {
// //         return response.data;
// //       } else {
// //         // Handle non-200 status codes here
// //         log("Request failed with status code ${response.statusCode}");
// //         return null;
// //       }
// //     } catch (error) {
// //       // Handle network errors here
// //       log("Network error: $error");
// //       return null;
// //     }
// //   }

// //   static Future<void> createPost3(File file) async {
//     // try {
//     //   String fileName = file.path.split('/').last;
//     //   log(file.path);
//     //   FormData formData = FormData.fromMap({
//     //     'description': 'sample',
//     //     'is_story': false,
//     //     'files': MultipartFile.fromFileSync (
//     //       file.path,
//     //       filename: fileName,
//     //       contentType:  MediaType("image", "jpeg")),

//     //   });

//     //   var response = await _post("/api/v1/posts", formData);

//   static Future<Response> retrieveAllPosts(Map<String, int?>? payload) async {
//     return (await _formdataInstance())
//         .get("/api/post/posts", data: payload);
//   }

// }
