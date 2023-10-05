import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:spade_v4/Presentation/Screens/messages/model/messages.dart';

final messageRepository = Provider((ref) => MessageRepository());

class MessageRepository {
  final _client = Client();
  final baseUrl = "https://spade-backend-v3-production.up.railway.app/api/v1";
  Future<Messages> getMessages() async {
    final response =
        await _client.get(Uri.parse("$baseUrl/messages/10"), headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyLCJuYW1lIjoiZWJlbiIsImVtYWlsIjoiZWJlbkBnbWFpbC5jb20iLCJpYXQiOjE2OTE0MTkzNTV9.4n9eOkR0pzNBsLWdNhU3yGFlJB01zhyfe_wRPSo-XWY"
    });
    final data = jsonDecode(response.body);
    return Messages.fromJson(data);
  }
}
