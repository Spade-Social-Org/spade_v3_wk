import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/messages.dart';
import '../widget/message_bubble.dart';

class MessageList extends StatelessWidget {
  final Map<DateTime?, List<MessageData>> data;
  const MessageList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return CustomScrollView(
          slivers: data.entries
              .map(
                (messages) => SliverMainAxisGroup(slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: HeaderDelegate(
                        DateFormat.yMMMd().format(messages.key!)),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverList.separated(
                        itemBuilder: (_, int i) =>
                            MessageBubble(message: messages.value[i]),
                        separatorBuilder: (_, __) => const SizedBox.shrink(),
                        itemCount: messages.value.length),
                  ),
                ]),
              )
              .toList());
    });
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  const HeaderDelegate(this.title);
  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          height: 30,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(title),
          )),
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

var groupByDate = groupBy(messageList, (obj) => obj.time);

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat('MMMM dd, y');
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
