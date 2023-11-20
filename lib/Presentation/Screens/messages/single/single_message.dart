import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:spade_v4/Presentation/Screens/messages/provider/socket_provider.dart';
import 'package:spade_v4/Presentation/Screens/messages/single/message_textfield.dart';
import 'package:spade_v4/Presentation/Screens/messages/widget/custom_iconbutton.dart';
import 'package:flutter/material.dart';
import '../provider/message_provider.dart';
import '../widget/message_bubble.dart';

final messageFutureProvider =
    FutureProvider((ref) => ref.watch(messageProvider).getMessages());

class SingleMessage extends ConsumerStatefulWidget {
  final int userId;
  final String username;
  const SingleMessage(
      {super.key, required this.userId, required this.username});

  @override
  ConsumerState<SingleMessage> createState() => _SingleMessageState();
}

class _SingleMessageState extends ConsumerState<SingleMessage> {
  final controller = TextEditingController();
  final scrollCtrl = ScrollController();
  String replyingText = '';

  void submit() {
    ref.read(socketProvider.notifier).sendMessage(
        text: controller.text.trim(), receiverId: widget.userId.toString());
    setState(() => controller.text = '');
    ref.invalidate(messageFutureProvider);
    scrollCtrl.animateTo(0.0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void sedn() {}
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
          body: SafeArea(
              child: ref.watch(messageFutureProvider).when(
                  data: (data) {
                    final messages = groupBy(data, (key) => key.createdAt);
                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                              const SizedBox(width: 8),
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
                                  imageValue: 'video', onTap: () {}, size: 20),
                              CustomIconButton(
                                  imageValue: 'call', onTap: () {}, size: 20),
                              CustomIconButton(
                                  imageValue: 'calendar',
                                  color: Colors.grey,
                                  onTap: () {},
                                  size: 20),
                              CustomIconButton(
                                  imageValue: 'more-vert',
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            padding: EdgeInsets.all(0),
                                            content: SizedBox(
                                                height: 25,
                                                child:
                                                    Text('You are offline'))));
                                  },
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
                        Expanded(
                          child: CustomScrollView(
                              controller: scrollCtrl,
                              shrinkWrap: true,
                              reverse: true,
                              slivers: messages.entries
                                  .map(
                                    (messages) => SliverMainAxisGroup(slivers: [
                                      SliverPersistentHeader(
                                        pinned: true,
                                        delegate: HeaderDelegate(
                                            DateFormat.yMMMd()
                                                .format(messages.key!)),
                                      ),
                                      SliverPadding(
                                        padding: const EdgeInsets.all(8.0),
                                        sliver: SliverList.separated(
                                            itemBuilder: (_, int i) =>
                                                MessageBubble(
                                                  replyingText: '',
                                                  message: messages.value[i],
                                                  onPressed: () {
                                                    setState(() {
                                                      replyingText = messages
                                                          .value[i].content!;
                                                    });
                                                  },
                                                ),
                                            separatorBuilder: (_, __) =>
                                                const SizedBox.shrink(),
                                            itemCount: messages.value.length),
                                      ),
                                    ]),
                                  )
                                  .toList()),
                        ),
                        const SizedBox(height: 8),
                        MessageTextfield(
                            message: replyingText,
                            username: widget.username,
                            onSubmitted: (_) => submit(),
                            onTap: () => submit(),
                            clearChat: () => setState(() => replyingText = ''),
                            onChanged: (value) => setState(() {}),
                            controller: controller),
                        const SizedBox(height: 12),
                      ],
                    );
                  },
                  error: (e, t) => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink())));
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
