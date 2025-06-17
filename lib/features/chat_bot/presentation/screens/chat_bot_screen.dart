import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../state_management/chat_cubit/chat_bot_cubit.dart';
import '../state_management/chat_cubit/chat_bot_state.dart';
import '../widgets/chat_screen_widgets/chat_header_widget.dart';
import '../widgets/chat_screen_widgets/chat_text_field_container.dart';
import '../widgets/chat_screen_widgets/message_bubble.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/entities/message.dart';

class ChatBotScreen extends StatefulWidget {
  final Object? arguments;

  const ChatBotScreen({super.key, this.arguments});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final ScrollController scrollController = ScrollController();

  void scrollToBottom() =>
      scrollController.jumpTo(scrollController.position.maxScrollExtent);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();

      if (widget.arguments != null) {
        if (widget.arguments is Map<String, dynamic>) {
          final args = widget.arguments as Map<String, dynamic>;
          final chatId = args['chatId'] as String;
          final messages = args['messages'] as List<MessageEntity>;
          context.read<ChatBotCubit>().loadMessages(messages, chatId);
        } else if (widget.arguments is String) {
          final chatId = widget.arguments as String;
          context.read<ChatBotCubit>().setExistingChatId(chatId);
        }
      } else {
        context.read<ChatBotCubit>().startNewChat();
      }
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            BlocConsumer<ChatBotCubit, ChatBotState>(
              builder: (context, state) {
                final cubit = context.read<ChatBotCubit>();
                return Column(
                  children: [
                    const ChatHeaderWidget(),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.messages.length +
                            (state is ChatBotLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < cubit.messages.length) {
                            final message = cubit.messages[index];
                            return _buildMessageBubble(message, cubit);
                          } else {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Assets.lotties.healixLoading.lottie(
                                width: 200.w,
                                height: 90.h,
                                fit: BoxFit.fill,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const ChatTextFieldContainer(),
                  ],
                );
              },
              listener: (BuildContext context, state) {
                if (state is ChatBotLoading ||
                    state is ChatBotSuccess ||
                    state is ChatBotFailure ||
                    state is ChatBotFilesSelected) {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => scrollToBottom());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(MessageEntity message, ChatBotCubit cubit) {
    final oldMessage = _convertToOldMessage(message);

    return MessageBubble(
      key: ValueKey(message.date.toIso8601String()),
      message: oldMessage,
      onOptionSelected: (option) {
        cubit.sendMessage(option: option);
      },
    );
  }

  _convertToOldMessage(MessageEntity messageEntity) {
    return Message(
      isUser: messageEntity.isUser,
      message: messageEntity.content,
      date: messageEntity.date,
      options: messageEntity.options,
      hasObservations: messageEntity.hasObservations,
      observations: messageEntity.observations,
      chatId: messageEntity.chatId,
      id: messageEntity.id,
      files: messageEntity.files,
    );
  }
}
