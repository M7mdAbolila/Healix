import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/widgets/custom_button.dart';
import 'package:healix/features/chat_bot/presentation/widgets/main_chat_bot_screen_widgets/previous_discussions_card.dart';
import '../../logic/all_chats_cubit/all_chats_cubit.dart';
import '../../logic/all_chats_cubit/all_chats_state.dart';

class PreviousDiscussionsSection extends StatelessWidget {
  const PreviousDiscussionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllChatsCubit, AllChatsState>(
      builder: (context, state) {
        if (state is AllChatsLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AllChatsError) {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading chats',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.errMessage,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    onTap: () => context.read<AllChatsCubit>().refreshChats(),
                    title: 'Retry',
                  ),
                ],
              ),
            ),
          );
        } else if (state is AllChatsSuccess) {
          final chats = state.chatsResponse.chats;

          if (chats.isEmpty) {
            return Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No previous discussions',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start a new conversation to see your chat history',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<AllChatsCubit>().refreshChats();
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: chats.length,
                reverse: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return PreviousDiscussionsCard(
                    chat: chat,
                  );
                },
              ),
            ),
          );
        }

        return const Expanded(
          child: SizedBox.shrink(),
        );
      },
    );
  }
}
