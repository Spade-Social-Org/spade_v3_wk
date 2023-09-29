import 'package:spade_v4/Presentation/Screens/messages/single/message_textfield.dart';
import 'package:spade_v4/Presentation/Screens/messages/widget/custom_iconbutton.dart';
import 'package:flutter/material.dart';

class SingleMessage extends StatefulWidget {
  const SingleMessage({super.key});

  @override
  State<SingleMessage> createState() => _SingleMessageState();
}

class _SingleMessageState extends State<SingleMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          'Maria',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.circle, color: Color(0xff155332), size: 8)
                      ],
                    ),
                    Text('Online')
                  ],
                ),
                const Spacer(),
                CustomIconButton(imageValue: 'video', onTap: () {}, size: 20),
                CustomIconButton(imageValue: 'call', onTap: () {}, size: 20),
                CustomIconButton(
                    imageValue: 'calendar', onTap: () {}, size: 20),
                CustomIconButton(
                    imageValue: 'more-vert', onTap: () {}, size: 20),
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
          const Spacer(),
          const MessageTextfield(),
          const SizedBox(height: 16),
        ],
      )),
    );
  }
}
