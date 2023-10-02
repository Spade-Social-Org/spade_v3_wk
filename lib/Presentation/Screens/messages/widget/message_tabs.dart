import 'package:flutter/material.dart';

import 'message_card.dart';

class MessageTabs extends StatelessWidget {
  final ValueChanged<int> onTap;
  final Color indicatorColor;
  final int selectedTab;
  const MessageTabs(
      {super.key,
      required this.onTap,
      required this.indicatorColor,
      required this.selectedTab});

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
              tabs: [
                Tab(
                    child: Text(
                  'Single & Searching',
                  style: TextStyle(
                      color: selectedTab == 0
                          ? const Color(0xff155332)
                          : Colors.grey),
                )),
                Tab(
                    child: Text(
                  'Red Light',
                  style: TextStyle(
                      color: selectedTab == 1
                          ? const Color(0xfff3495e)
                          : Colors.grey),
                )),
                Tab(
                    child: Text(
                  'Long Term',
                  style: TextStyle(
                      color: selectedTab == 2
                          ? const Color(0xff999999)
                          : Colors.grey),
                )),
                Tab(
                    child: Text(
                  'Friends',
                  style: TextStyle(
                      color: selectedTab == 3
                          ? const Color(0xfffed557)
                          : Colors.grey),
                )),
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
