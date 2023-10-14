import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_attorney/features/chat/presentation/widgets/chat_body.dart';
import 'package:my_attorney/features/chat/presentation/widgets/chat_tile.dart';
import 'package:my_attorney/features/chat/providers/chat_provider.dart';
import 'package:my_attorney/features/home/providers/user_provider.dart';
import 'package:my_attorney/features/home_page/presentation/lawyer_details_page.dart';
import 'package:my_attorney/features/invoice/presentation/create_invoice.dart';
import 'package:my_attorney/packages/packages.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final chats = ref.watch(chatProvider);
    final onMessageSwipeMessage = chats.referenceMessage;
    final user = ref.watch(userProvider);
    final conversation = chats.currentConversation;
    if (conversation == null) {
      return const Scaffold(
        body: Center(
          child: Text('No conversation selected'),
        ),
      );
    }
    final other = conversation.participantOne?.id == user.data?.id
        ? conversation.participantTwo
        : conversation.participantOne;

    return WillPopScope(
      onWillPop: () async {
        ref.read(chatProvider.notifier).disconnect();
        // final currentMessages = ref.read(chatProvider).allConversations;
        // ref.refresh(chatProvider);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Row(
            children: [
              ClipOval(
                child: Image.network(
                  other?.profileImage ?? AppConstants.defaultImage,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              18.spacingW,
              Expanded(
                child: InkWell(
                  onTap: () {
                    pushTo(
                        context, LawyerDetailsPage(id: other!.id!.toString()));
                  },
                  child: Text(
                    '${other?.firstName ?? ''} ${other?.lastName ?? ''}',
                    style: CustomTextStyle.textLg18.w500.careerHeading,
                  ),
                ),
              ),
              if (user.data?.lawyer != null)
                InkWell(
                  onTap: () {
                    CreateInvoice.prompt(context, other: other!);
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Invoice',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        4.spacingW,
                        SvgPicture.asset(
                          IconsaxLinear.add,
                          height: 10,
                          width: 10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ).alignRight,
                ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Flexible(
              fit: FlexFit.loose,
              child: ChatBody(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      if (onMessageSwipeMessage != null) ...[
                        Row(
                          children: [
                            Expanded(
                              child: ChatTile(
                                message: onMessageSwipeMessage,
                                me: user.data!.id!,
                                maxLines: 1,
                              ),
                            ),
                            8.spacingW,
                            InkWell(
                              onTap: () {
                                ref
                                    .read(chatProvider.notifier)
                                    .setReference(null);
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFFFFFFF),
                                  shape: OvalBorder(),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    IconsaxLinear.closeCircle,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        4.spacingH,
                      ],
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: 'Type a message',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Color(0xFFF6F6F6),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                8.spacingW,
                InkWell(
                  onTap: () {
                    if (_textController.text.trim().isEmpty) return;
                    ref.read(chatProvider.notifier).sendChat(
                          text: _textController.text,
                          replyMessage: onMessageSwipeMessage,
                        );

                    _textController.clear();
                    ref.read(chatProvider.notifier).setReference(null);
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFEB9B00),
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        IconsaxLinear.send1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingOnly(
              b: 20,
              l: 20,
              r: 20,
            ),
          ],
        ),
      ),
    );
  }
}
