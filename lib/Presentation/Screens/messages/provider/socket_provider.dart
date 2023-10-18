import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/prefs/pref_provider.dart';

import '../../../../Common/api.dart';

class SocketProvider extends StateNotifier<SocketModel> {
  SocketProvider() : super(SocketModel());

  Future initializeSocket() async {
    final token = await PrefProvider.getUserToken();
    final socket = IO.io(
        'https://spade-backend-v3-production.up.railway.app/',
        IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
            {...customHeader, 'authorization': 'Bearer $token'}).build());
    socket.connect();
    socket.onConnect((data) {
      print('connected');
    });
    socket.on('message.private', (data) {
      print(data);
    });
  }

  Future<void> sendMessage({String? text, String? receiverId}) async {
    final token = await PrefProvider.getUserToken();
    final socket = IO.io(
        'https://spade-backend-v3-production.up.railway.app/',
        IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
            {...customHeader, 'authorization': 'Bearer $token'}).build());

    socket
        .emit('message.private', {'content': text, 'receiver_id': receiverId});
  }
}

class SocketModel {
  final IO.Socket? socket;

  SocketModel({this.socket});
}
