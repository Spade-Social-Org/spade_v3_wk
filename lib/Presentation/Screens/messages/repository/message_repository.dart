import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/save_user_tokens/save_user_tokens.dart';
import 'package:spade_v4/Presentation/Screens/messages/model/chat_model.dart';
import 'package:spade_v4/Presentation/Screens/messages/model/messages.dart';

final messageRepository = Provider((ref) => MessageRepository());

class MessageRepository {
  final _client = Client();
  final baseUrl = "https://spade-backend-v3-production.up.railway.app/api/v1";

  Future<Messages> getUserMessages() async {
    final token = await GetUserToken.getLoginValue();
    final id = await GetUserToken.getUserId();
    final response = await _client.get(Uri.parse("$baseUrl/messages/$id"),
        headers: {"Authorization": "Bearer $token"});
    final data = jsonDecode(response.body);
    return Messages.fromJson(data);
  }

  Future<ChatsResponseModel> getUserChats() async {
    final token = await GetUserToken.getLoginValue();
    final response = await _client.get(Uri.parse("$baseUrl/messages"),
        headers: {"Authorization": "Bearer $token"});
    final data = jsonDecode(response.body);
    return ChatsResponseModel.fromJson(data);
  }
}
