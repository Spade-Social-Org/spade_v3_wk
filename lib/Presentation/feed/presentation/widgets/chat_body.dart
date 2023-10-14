import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_attorney/core/core.dart';
import 'package:my_attorney/core/utils/utils.dart';
import 'package:my_attorney/features/chat/presentation/widgets/chat_tile.dart';
import 'package:my_attorney/features/chat/providers/chat_provider.dart';
import 'package:my_attorney/features/home/providers/user_provider.dart';
import 'package:my_attorney/features/home_page/presentation/lawyer_details_page.dart';
import 'package:my_attorney/packages/global_packages.dart';
import 'package:my_attorney/packages/packages.dart';
import 'package:my_attorney/packages/textstyles/app_textstyles.dart';
import 'package:my_attorney/resources/resources.dart';

class ChatBody extends ConsumerStatefulWidget {
  const ChatBody({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatBodyState();
}

class _ChatBodyState extends ConsumerState<ChatBody> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final hasMore = ref.read(chatProvider).currentMessages?.data?.hasMore;
        if (hasMore ?? false) {
          ref.read(chatProvider.notifier).nextChat();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chats = ref.watch(chatProvider);
    final user = ref.watch(userProvider);
    if (chats.currentMessages == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        reverse: true,
        itemCount: (chats.currentMessages?.data?.messages?.length ?? 0) + 1,
        padding: const EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          if (index == chats.currentMessages!.data!.messages!.length) {
            final conversation = chats.currentConversation;
            final other = conversation!.participantOne!.id == user.data!.id
                ? conversation.participantTwo
                : conversation.participantOne;
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: const EdgeInsets.only(bottom: 25),
              decoration: ShapeDecoration(
                color: const Color(0x7FEFEFEF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      other?.profileImage ?? AppConstants.defaultImage,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  3.spacingH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${other?.firstName} ${other?.lastName}',
                        style: CustomTextStyle.textSm14.w700,
                      ),
                      SvgPicture.asset(
                        HomeIcons.verified,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      pushTo(context,
                          LawyerDetailsPage(id: other!.id!.toString()));
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'View Profile',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          4.spacingW,
                          SvgPicture.asset(
                            IconsaxLinear.arrowRight,
                            height: 10,
                            width: 10,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          final message = chats.currentMessages!.data!.messages![index];
          double padding = 3;
          if (index != chats.currentMessages!.data!.messages!.length - 1) {
            if (chats.currentMessages!.data!.messages![index + 1].sender !=
                message.sender) {
              padding = 8;
            }
          }
          return ChatTile(
                  key: UniqueKey(), message: message, me: user.data!.id!)
              .paddingOnly(
            t: padding,
          );
        },
      ),
    );
  }
}
