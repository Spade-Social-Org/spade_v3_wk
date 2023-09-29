import 'package:flutter/material.dart';

import 'message_card.dart';

class MessageTabs extends StatelessWidget {
  final ValueChanged<int> onTap;
  final Color indicatorColor;
  const MessageTabs(
      {super.key, required this.onTap, required this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
              onTap: onTap,
              indicatorColor: indicatorColor,
              isScrollable: true,
              labelColor: indicatorColor,
              tabs: const [
                Tab(text: 'Single & Searching'),
                Tab(text: 'Red Light'),
                Tab(text: 'Long Term'),
                Tab(text: 'Friends'),
              ]),
          const SizedBox(height: 25),
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: TabBarView(clipBehavior: Clip.none, children: [
              MessageCard(
                  messageLength: '5',
                  messageLengthColor: Colors.blueGrey,
                  sender: 'Maria',
                  message: 'Hey! How are you',
                  indicatorColor: indicatorColor,
                  timeSent: '5:40'),
            ]),
          )
        ],
      ),
    );
  }
}
