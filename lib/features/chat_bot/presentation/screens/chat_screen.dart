import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/assets.gen.dart';
import '../logic/chat_cubit/chat_cubit.dart';
import '../widgets/chat_screen_widgets/chat_header_widget.dart';
import '../widgets/chat_screen_widgets/chat_text_field_container.dart';
import '../widgets/chat_screen_widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController scrollController = ScrollController();
  void scrollToBottom() =>
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
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
        body: BlocConsumer<ChatCubit, ChatState>(
          builder: (context, state) {
            final cubit = context.read<ChatCubit>();
            return Column(
              children: [
                const ChatHeaderWidget(),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        cubit.messages.length + (state is ChatLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < cubit.messages.length) {
                        final message = cubit.messages[index];
                        return MessageBubble(
                          key: ValueKey(message.date.toIso8601String()),
                          message: message,
                          onOptionSelected: (option) {
                            cubit.sendMessage(option: option);
                          },
                        );
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
            if (state is ChatLoading ||
                state is ChatSuccess ||
                state is ChatFailure ||
                state is ChatFilesSelected) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => scrollToBottom());
            } else if (state is ChatMessage) {
              // Show snackbar for user feedback
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: state.isError ? Colors.red : Colors.blue,
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
