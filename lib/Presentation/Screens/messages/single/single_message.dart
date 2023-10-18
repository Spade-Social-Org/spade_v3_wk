import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Presentation/Screens/messages/provider/socket_provider.dart';
import 'package:spade_v4/Presentation/Screens/messages/single/message_list.dart';
import 'package:spade_v4/Presentation/Screens/messages/single/message_textfield.dart';
import 'package:spade_v4/Presentation/Screens/messages/widget/custom_iconbutton.dart';
import 'package:flutter/material.dart';
import '../provider/message_provider.dart';

final messageFutureProvider =
    FutureProvider((ref) => ref.watch(messageProvider).getMessages());

class SingleMessage extends StatefulWidget {
  final int userId;
  final String username;
  const SingleMessage(
      {super.key, required this.userId, required this.username});

  @override
  State<SingleMessage> createState() => _SingleMessageState();
}

class _SingleMessageState extends State<SingleMessage> {
  final controller = TextEditingController();
  @override
  void initState() {
    SocketProvider().initializeSocket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
          body: SafeArea(
              child: ref.watch(messageFutureProvider).when(
                  data: (data) => Column(
                        children: [
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage('assets/images/avatar.png'),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          widget.username,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.circle,
                                            color: Color(0xff155332), size: 8)
                                      ],
                                    ),
                                    const Text('Online')
                                  ],
                                ),
                                const Spacer(),
                                CustomIconButton(
                                    imageValue: 'video',
                                    onTap: () {},
                                    size: 20),
                                CustomIconButton(
                                    imageValue: 'call', onTap: () {}, size: 20),
                                CustomIconButton(
                                    imageValue: 'calendar',
                                    onTap: () {},
                                    size: 20),
                                CustomIconButton(
                                    imageValue: 'more-vert',
                                    onTap: () {},
                                    size: 20),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.keyboard_arrow_up)),
                          ),
                          const Divider(),
                          Expanded(child: MessageList(data: data)),
                          const SizedBox(height: 8),
                          MessageTextfield(
                              onTap: () {
                                SocketProvider().sendMessage(
                                    text: controller.text.trim(),
                                    receiverId: widget.userId.toString());
                                ref.invalidate(messageFutureProvider);
                              },
                              controller: controller),
                          const SizedBox(height: 12),
                        ],
                      ),
                  error: (e, t) => const SizedBox.shrink(),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ))));
    });
  }
}
