import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Messages message;
  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment:
                message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              message.isMe
                  ? const SizedBox.shrink()
                  : const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
              const SizedBox(width: 8),
              Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: message.isMe
                        ? const Color(0xffef0c28)
                        : const Color(0xfff5f5f5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(8),
                      topLeft: message.isMe
                          ? const Radius.circular(8)
                          : const Radius.circular(0),
                      topRight: message.isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(8),
                      bottomRight: const Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        message.message,
                        style: TextStyle(
                            color: message.isMe ? Colors.white : Colors.black),
                      )))
            ])
      ],
    );
  }
}

final messageList = <Messages>[
  Messages(1, '2020-06-16T10:31:12.000Z', 'Hello dear', false),
  Messages(1, '2020-07-16T10:30:35.000Z', 'Good morning from here', true),
  Messages(1, '2020-07-14T09:41:18.000Z', 'How are doing?', true),
  Messages(1, '2020-06-15T09:41:18.000Z', 'Am fine dear', false),
  Messages(1, '2020-06-16T10:31:12.000Z', 'Hello dear', false),
  Messages(1, '2020-06-16T10:29:35.000Z', 'Good morning dear', true),
  Messages(1, '2020-06-15T09:41:18.000Z', 'How are doing?', true),
  Messages(1, '2020-06-15T09:41:18.000Z', 'Am fine dear', false),
  Messages(1, '2020-06-16T10:31:12.000Z', 'Hello dear', false),
  Messages(1, '2020-06-16T10:29:35.000Z', 'Good morning dear', true),
  Messages(1, '2020-06-15T09:41:18.000Z', 'How are doing?', true),
  Messages(1, '2023-08-15T09:41:18.000Z', 'Am fine dear', false),
];

class Messages {
  final int id;
  final String time;
  final String message;
  final bool isMe;

  Messages(this.id, this.time, this.message, this.isMe);
}
