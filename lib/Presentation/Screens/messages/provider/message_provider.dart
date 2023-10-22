import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Presentation/Screens/messages/repository/message_repository.dart';

import '../model/chat_model.dart';
import '../model/messages.dart';
import '../model/user_matches_response_model.dart';

final chatListFutureProvider =
    FutureProvider((ref) => ref.watch(messageProvider).getUserChats());

final userMatchesFutureProvider =
    FutureProvider((ref) => ref.watch(messageProvider).getUserMatches());

final messageProvider = Provider((ref) => MessageProvider(ref));

class MessageProvider {
  final Ref ref;

  MessageProvider(this.ref);

  Future<List<MessageData>> getMessages() async {
    return await ref.watch(messageRepository).getUserMessages();
  }

  Future<List<ChatsData>> getUserChats() async {
    final response = await ref.watch(messageRepository).getUserChats();
    return response.data;
  }

  Future<List<UserMatchesResponseData>> getUserMatches() async {
    return await ref.watch(messageRepository).getUserMatches();
  }
}
