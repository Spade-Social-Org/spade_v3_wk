import 'package:flutter/material.dart';

import 'group/group_message.dart';
import 'likes/message_likes.dart';
import 'widget/custom_appbar.dart';
import 'widget/custom_iconbutton.dart';
import 'widget/message_card.dart';
import 'widget/message_tabs.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool isSelected = false;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(60, 100),
        child: SafeArea(child: CustomAppbar(title: 'Messages')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Text(
                'Top 5 picks',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  5,
                  (i) => Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/avatar.png')),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.green)),
                      )),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 45,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          fillColor: const Color(0xfff5f5f5),
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset('assets/images/search.png'),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  )),
                  const SizedBox(width: 8),
                  CustomIconButton(
                      imageValue: 'spade',
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => MesssageLikes())),
                      size: 22),
                  CustomIconButton(
                      imageValue: 'grid',
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => GroupMessage())),
                      size: 20),
                  CustomIconButton(
                      imageValue: 'list',
                      color: indicatorColor(),
                      onTap: () => setState(() => isSelected = !isSelected),
                      size: 20)
                ],
              ),
            ),
            const SizedBox(height: 25),
            isSelected
                ? MessageTabs(
                    selectedTab: selectedTab,
                    onTap: (i) => setState(() => selectedTab = i),
                    indicatorColor: indicatorColor())
                : const MessageCard(
                    messageLength: '5',
                    messageLengthColor: Colors.blueGrey,
                    sender: 'Maria',
                    message: 'Hey! How are you',
                    indicatorColor: Color(0xff155332),
                    timeSent: '5:40')
          ],
        ),
      ),
    );
  }

  Color indicatorColor() {
    switch (selectedTab) {
      case 0:
        return const Color(0xff155332);
      case 1:
        return const Color(0xfff3495e);
      case 2:
        return const Color(0xff999999);
      case 3:
        return const Color(0xfffed557);
    }
    return Colors.white;
  }
}
