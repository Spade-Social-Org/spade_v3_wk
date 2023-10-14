import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_attorney/core/utils/extensions/date_extensions.dart';
import 'package:my_attorney/features/chat/models/get_all_conversations_model.dart';
import 'package:my_attorney/features/chat/providers/chat_provider.dart';
import 'package:my_attorney/features/home/providers/user_provider.dart';
import 'package:my_attorney/packages/packages.dart';

class ChatCard extends ConsumerWidget {
  final Conversation conversation;
  const ChatCard({
    super.key,
    required this.conversation,
  });

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userProvider);
    final other = conversation.participantOne?.id == user.data?.id
        ? conversation.participantTwo
        : conversation.participantOne;

    return InkWell(
      onTap: () {
        ref.read(chatProvider.notifier).enterChat(
              context,
              conversation: conversation,
            );
      },
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              other?.profileImage ?? AppConstants.defaultImage,
              height: 54,
              width: 54,
              fit: BoxFit.cover,
            ),
          ),
          12.spacingW,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${other?.firstName ?? ''} ${other?.lastName ?? ''}',
                        style: CustomTextStyle.textSm14.w700,
                      ),
                    ),
                    Text(
                      conversation.message?.createdAt?.formatTimeOnly24 ?? '',
                      style: CustomTextStyle.textXxx8,
                    ),
                  ],
                ),
                4.spacingH,
                Text(
                  conversation.message?.content ?? '...',
                  style: CustomTextStyle.textXxs10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
