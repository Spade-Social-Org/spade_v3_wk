import 'package:app/Presentation/Screens/messages/single/single_message.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class MessageCard extends StatelessWidget {
  final String messageLength;
  final Color messageLengthColor;
  final String sender;
  final String message;
  final Color indicatorColor;
  final String timeSent;

  const MessageCard(
      {super.key,
      required this.messageLength,
      required this.messageLengthColor,
      required this.sender,
      required this.message,
      required this.indicatorColor,
      required this.timeSent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MaterialButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => SingleMessage())),
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    Positioned(
                      right: -8,
                      top: -8,
                      child: HexagonWidget.flat(
                        width: 25,
                        color: Colors.blueGrey,
                        padding: 2.0,
                        child: const Text(
                          '5',
                          style: TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          sender,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.circle, color: indicatorColor, size: 8)
                      ],
                    ),
                    Text(message)
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      timeSent,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset('assets/images/timer.png', height: 17),
                        const Positioned(
                            right: 3,
                            bottom: -3,
                            child: Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xff155332)),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:
                    LinearProgressIndicator(value: 0.6, color: indicatorColor))
          ],
        ),
      ),
    );
  }
}
