import 'dart:convert';
import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Common/api.dart';
import 'package:spade_v4/Common/api_handler/api_client_config.dart';
import 'package:spade_v4/Common/api_handler/api_handler_models.dart';

final feedProvider = StateNotifierProvider<FeedProvider, FeedRepo>((ref) {
  return FeedProvider(ref);
});

class FeedProvider extends StateNotifier<FeedRepo> {
  final Ref ref;

  FeedProvider(this.ref) : super(FeedRepo());
}

class FeedRepo {
  FeedRepo();

  FeedRepo copyWith() {
    return FeedRepo();
  }

  final BackendService _apiService = BackendService(
    Dio(),
  );

  Future<ResponseModel> createPost({
    required String description,
    required bool isStory,
    required String filePath,
  }) async {
    Response response = await _apiService.runCall(
      _apiService.dio.post(
        '${AppEndpoints.baseUrl}/api/v1/posts',
        data: FormData.fromMap({
          "description": description,
          "is_story": isStory,
          "files": await MultipartFile.fromFile(
            filePath,
            filename: filePath.split('/').last,
            contentType: MediaType('image', 'jpg'),
          ),
        }),
      ),
    );

    final num statusCode = response.statusCode ?? 000;

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel(
        valid: true,
        statusCode: statusCode,
        message: response.data['message'],
        data: response.data,
      );
    }

    return ResponseModel(
      error: ErrorModel.fromJson(response.data),
      statusCode: statusCode,
      message: response.data['message'],
    );
  }
}
