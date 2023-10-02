import 'package:flutter/material.dart';

class MessageTextfield extends StatelessWidget {
  const MessageTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Message...',
                  fillColor: const Color(0xfff5f5f5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50))),
            ),
          )),
          const SizedBox(width: 8),
          IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset('assets/images/send.png'),
              )),
        ],
      ),
    );
  }
}
