import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Presentation/Screens/messages/repository/message_repository.dart';
import 'package:spade_v4/Presentation/Screens/messages/widget/custom_snackbar.dart';

import '../model/messages.dart';

final messageProvider = Provider((ref) => MessageProvider(ref));

class MessageProvider {
  final Ref ref;

  MessageProvider(this.ref);

  Future<Map<DateTime?, List<MessageData>>> getMessages() async {
    try {
      final response = await ref.watch(messageRepository).getMessages();
      var groupByDate = groupBy(response.data, (obj) => obj.createdAt);

      return groupByDate;
    } on SocketException catch (_) {
      customSnackBar('No internet connection');
      rethrow;
    } on TimeoutException catch (_) {
      //customSnackBar('No internet connection');
      rethrow;
    } catch (e) {
      print(e);
      customSnackBar('Something went wrong');
      rethrow;
    }
  }
}
