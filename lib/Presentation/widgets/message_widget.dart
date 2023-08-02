import 'package:flutter/material.dart';

import 'package:swipe_to/swipe_to.dart';

import '../../Data/Models/chat_model.dart';
import '../Screens/Chats/chat_screen.dart';



class MessageWidget extends StatelessWidget {

  final ValueChanged<Message> onSwipedMessage;
  const MessageWidget({
    super.key,
    required List<Message> messages,
    required this.widget, required this.onSwipedMessage,
  }) : _messages = messages;

  final List<Message> _messages;
  final ChatScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true, 
        primary: false,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          final isMe = message.sender == 'user1';
          return SwipeTo(
            
            onRightSwipe: () => onSwipedMessage(message),
            child: Column(
              children: [
                ListTile(
                  leading: isMe
                      ? null
                      : CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,
                          backgroundImage:
                              NetworkImage(widget.chat.profileImageUrl),
                        ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: isMe
                            ? const Color.fromARGB(255, 202, 81, 73)
                            : Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          message.text,
                          style: TextStyle(
                              fontSize: 16,
                              color: isMe ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  trailing: isMe ? const Icon(Icons.check) : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
