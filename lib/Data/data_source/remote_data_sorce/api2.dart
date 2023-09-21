import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:spade_v4/Data/Models/story/story_view_model.dart';
import 'package:spade_v4/Presentation/widgets/story/story_controller.dart';

import '../../../Presentation/widgets/posts/new_post_controller.dart';
import '../../../Presentation/widgets/posts/post_controller.dart';
import '../../../Presentation/widgets/story/new_story_controller.dart';
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
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjExLCJuYW1lIjoiRmF2b3VyIiwiZW1haWwiOiJsZXdlY2hpZ29kc2Zhdm91ckBnbWFpbC5jb20iLCJ2ZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNjk1MDEwNDQ3fQ.stQATT8eecn4Xm4t6M89Hr9QrRt7oRs9Jj-DcSwf4Ow",
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
    print('1');
    if (file == null) {
      print('2');
      throw Exception('File cannot be null');
    }
    print('3');
    String fileName = file.path.split('/').last;
    print('4');
    log(file.path);
    print('5');
    FormData formData = FormData.fromMap({
      'description': 'sample1',
      'is_story': false,
      'files': MultipartFile.fromFileSync(file.path,
          filename: fileName, contentType: MediaType("image", "jpg")),
    });
    print('6');
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

  static Future<void> createAndDisplayPost1(File file) async {
    try {
      Response response = await ApiService.createPost3(file);
      log("result: ${response.statusCode}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;
        final List<dynamic> jsonList = responseData['data'] as List<dynamic>;
        log("result Data: $jsonList");
        final newPost = NewPost.fromJson(responseData);
        NewPostController().addPost = newPost;
      } else {
        log("${response.statusMessage}");
      }
    } catch (e) {
      log("$e");
    }
  }

  static Future<void> createAndDisplayStory(File file) async {
    try {
      print('error10');

      Response response = await ApiService.createStory3(file);
      print('error11');

      if (response.statusCode == 200) {
        print('error12');

        final responseData = response.data;
        print('error13');
        print("$responseData");
        if (responseData == null) {
          print("$responseData");
          return;
        }
        print("$responseData");
        // Check if the responseData contains the expected fields
        if (responseData.containsKey('id') &&
            responseData.containsKey('created_at') &&
            responseData.containsKey('description') &&
            responseData.containsKey('gallery')) {
          print("$responseData");
          print('error14');

          final newStory = NewStory.fromJson(responseData);
          print("$responseData");
          print('error17');
          print("$responseData");
          NewStoryController().addStory = newStory;
          print("$responseData");
          print('error18');
        } else {
          print("${response.statusMessage}");
        }
      }
    } catch (e) {
      print("$e");
    }
  }

  static Future<void> createAndDisplayPost(File file) async {
    try {
      print('error10');
      Response response = await ApiService.createPost3(file);
      print('error11');

      if (response.statusCode == 200) {
        print('error12');

        final responseData = response.data;
        print('error13');

        if (responseData == null) {
          print("$responseData");
          print("Error creating post: Invalid response data");
          return;
        }

        // Check if the responseData contains the expected fields
        if (responseData.containsKey('id') &&
            responseData.containsKey('created_at') &&
            responseData.containsKey('description') &&
            responseData.containsKey('gallery')) {
          print("$responseData");
          print('error14');

          final newPost = NewPost.fromJson(responseData);
          print('error17');
          NewPostController().addPost = newPost;
          print("$responseData");
          print('error18');
        } else {
          print("$responseData");
        }
      } else {
        print("${response.statusMessage}");
      }
    } catch (e) {
      print("$e");
    }
  }

  static Future<List<Post>> getAllPost() async {
    try {
      final response = await _get("/api/v1/posts/user/feeds?is_story=false");
      final List<dynamic> responseData = response.data["data"];
      final List<Post> posts =
          responseData.map((data) => Post.fromJson(data)).toList();
      log(posts.toString());
      final postBloc = PostBloc();
      postBloc.addPosts(posts);
      return posts;
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
