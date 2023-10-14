import 'package:my_attorney/features/chat/models/get_all_conversations_model.dart';
import 'package:my_attorney/features/chat/models/get_all_messages_model.dart';
import 'package:my_attorney/features/chat/presentation/widgets/chat_card.dart';
import 'package:my_attorney/features/chat/providers/chat_provider.dart';
import 'package:my_attorney/features/home/presentation/custom_app_bar.dart';
import 'package:my_attorney/features/home/providers/user_provider.dart';
import 'package:my_attorney/features/home_page/presentation/widgets/home_header.dart';
import 'package:my_attorney/features/news_and_tips/presentation/legal_tips_and_news.dart';
import 'package:my_attorney/features/home_page/presentation/widgets/most_ordered_services.dart';
import 'package:my_attorney/features/home_page/presentation/widgets/popular_searches.dart';

import 'package:my_attorney/packages/packages.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final chats = ref.watch(chatProvider);
    final user = ref.watch(userProvider);
    if (chats.allConversations == null) {}
    final shownChats = chats.allConversations?.data?.conversations?.where(
          (element) {
            final other = element.participantOne?.id == user.data?.id
                ? element.participantTwo
                : element.participantOne;

            return '${other?.firstName ?? ''} ${other?.lastName ?? ''}'
                .toLowerCase()
                .contains(query.toLowerCase());
          },
        ).toList() ??
        [];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaQuery.paddingOf(context).top.spacingH,
          const Text(
            'Chat',
            style: CustomTextStyle.headingLarge,
          ).paddingSymmetric(h: 20),
          15.spacingH,
          AppInput.search(
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
          ).paddingSymmetric(h: 20),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                await ref.read(chatProvider.notifier).refreshData();
              },
              child: chats.allConversations == null
                  ? ListView.separated(
                      itemCount: 20,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return 25.spacingH;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Skeletonizer(
                          enabled: true,
                          child: ChatCard(
                            conversation: Conversation(
                              participantOne: Participant(
                                firstName: 'Johcwe',
                                lastName: 'Dovee',
                              ),
                              participantTwo: Participant(
                                firstName: 'Johcwe',
                                lastName: 'Dovee',
                              ),
                              message: Message(
                                content: 'Hello',
                                createdAt: DateTime.now(),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.separated(
                      itemCount: shownChats.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return 25.spacingH;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ChatCard(
                          conversation: shownChats[index],
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
