import 'package:flutter/material.dart';
import 'package:my_attorney/core/utils/extensions/date_extensions.dart';
import 'package:my_attorney/core/utils/utils.dart';
import 'package:my_attorney/features/chat/models/get_all_messages_model.dart';
import 'package:my_attorney/features/chat/providers/chat_provider.dart';
import 'package:my_attorney/features/home/providers/user_provider.dart';
import 'package:my_attorney/packages/packages.dart';
import 'package:swipe_to/swipe_to.dart';

class ChatTile extends ConsumerWidget {
  final Message message;
  final int me;
  final int? maxLines;
  const ChatTile({
    super.key,
    required this.message,
    required this.me,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? referenceName;
    if (message.referenceMessage != null) {
      final user = ref.watch(userProvider);
      final conversation = ref.watch(chatProvider).currentConversation;
      final other = conversation!.participantOne!.id == user.data!.id
          ? conversation.participantTwo
          : conversation.participantOne;
      referenceName = message.referenceMessage!.sender == user.data?.id
          ? '${user.data?.firstName} ${user.data?.lastName}'
          : '${other?.firstName} ${other?.lastName}';
    }

    return SwipeTo(
      iconOnRightSwipe: Icons.reply_rounded,
      onRightSwipe: () {
        ref.read(chatProvider.notifier).setReference(message);
      },
      child: Row(
        mainAxisAlignment: me == message.sender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (me == message.sender) 70.spacingW,
          Expanded(
            child: Align(
              alignment: me == message.sender
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 6,
                ),
                decoration: ShapeDecoration(
                  color: me == message.sender
                      ? const Color(0x142234CF)
                      : const Color(0xD3E4E4E4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: me == message.sender
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (maxLines == null &&
                            message.referenceMessage != null)
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                stops: [0.05, 0.05],
                                colors: [Colors.black, Colors.transparent],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              margin: const EdgeInsets.only(left: 1),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    referenceName ?? '',
                                    style: CustomTextStyle.textXs12.w600
                                        .withColor(const Color(0xFF2234CF)),
                                  ),
                                  Text(
                                    message.referenceMessage!.content ?? '',
                                    maxLines: 2,
                                    style: CustomTextStyle.textSm14.copyWith(
                                      color: me == message.sender
                                          ? const Color(0xFF2234CF)
                                          : const Color(0xFF383737),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Text(
                          message.content ?? '',
                          maxLines: maxLines,
                          style: CustomTextStyle.textSm14.copyWith(
                            color: me == message.sender
                                ? const Color(0xFF2234CF)
                                : const Color(0xFF383737),
                          ),
                        ),
                      ],
                    ),
                    if (maxLines == null) ...[
                      2.spacingH,
                      Text(
                        message.createdAt?.formatTimeOnly24 ?? '',
                        style: CustomTextStyle.textXxx8.copyWith(
                          color: me == message.sender
                              ? const Color(0xFF2234CF)
                              : const Color(0xFF383737),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          if (me != message.sender) 70.spacingW,
        ],
      ),
    );
  }
}
