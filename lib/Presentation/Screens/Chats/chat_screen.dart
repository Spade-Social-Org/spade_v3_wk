import 'package:flutter/material.dart';

import '../../../Data/Models/chat_model.dart';
import '../../widgets/message_widget.dart';
import '../Events/events_planing_screen.dart';



class ChatScreen extends StatefulWidget {
  final Chat chat;

  const ChatScreen({super.key, required this.chat});
  
   

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  late List<Message> _messages;

  

  @override
  void initState() {
    super.initState();
    _messages = List.from(widget.chat.messages);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    String text = _textEditingController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(Message(sender: 'user1', text: text));
        _textEditingController.clear();
      });
    }
  }


final focusNode = FocusNode();
  late Message replyMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(widget.chat.profileImageUrl),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.chat.username,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.call_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EventPlaningScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "June 4 2022",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            MessageWidget(
              messages: _messages,
              widget: widget,
              onSwipedMessage: (message) {
                replyToMessage(message);
                focusNode.requestFocus();
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)
                      ),
                        fillColor: const Color.fromARGB(77, 180, 179, 179),
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Type a message',
                        suffixIcon: GestureDetector(
                            onTap: _sendMessage,
                            child: Image.asset(
                              "assets/images/send.png",
                            ))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  replyToMessage(Message message) {
    setState(() {
      replyMessage = message;
    });
  }
}

