import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Presentation/Screens/messages/repository/message_repository.dart';
import 'package:spade_v4/Presentation/Screens/messages/widget/custom_snackbar.dart';

import '../model/chat_model.dart';
import '../model/messages.dart';

final messageProvider = Provider((ref) => MessageProvider(ref));

class MessageProvider {
  final Ref ref;

  MessageProvider(this.ref);

  Future<Map<DateTime?, List<MessageData>>> getMessages() async {
    try {
      final response = await ref.watch(messageRepository).getUserMessages();
      var groupByDate = groupBy(response.data, (obj) => obj.createdAt);

      return groupByDate;
    } on SocketException catch (_) {
      customSnackBar('No internet connection');
      rethrow;
    } catch (e) {
      print(e);
      customSnackBar('Something went wrong');
      rethrow;
    }
  }

  Future<List<ChatsData>> getUserChats() async {
    try {
      final response = await ref.watch(messageRepository).getUserChats();
      return response.data;
    } on SocketException catch (_) {
      customSnackBar('No internet connection');
      rethrow;
    } catch (e) {
      print(e);
      customSnackBar('Something went wrong');
      rethrow;
    }
  }
}
