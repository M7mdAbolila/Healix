import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/chat_cubit/chat_cubit.dart';
import '../widgets/chat_screen_widgets/chat_header_widget.dart';
import '../widgets/chat_screen_widgets/chat_text_field_container.dart';
import '../widgets/chat_screen_widgets/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final cubit = context.read<ChatCubit>();
            return Column(
              children: [
                const ChatHeaderWidget(),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        cubit.messages.length + (state is ChatLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < cubit.messages.length) {
                        final message = cubit.messages[index];
                        return MessageBubble(
                          key: ValueKey(message.date.toIso8601String()),
                          isUser: message.isUser,
                          message: message.message,
                          date: message.date,
                          images: message.images,
                          options: message.options,
                          hasObservations: message.hasObservations,
                          observations: message.observations,
                          onOptionSelected: (option) {
                            cubit.sendMessage(option: option);
                          },
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ),
                ChatTextFieldContainer(
                  controller: cubit.messageController,
                  onSend: () => cubit.sendMessage(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
