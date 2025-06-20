import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../state_management/chat_cubit/chat_bot_cubit.dart';
import '../../state_management/chat_cubit/chat_bot_state.dart';

class ChatMessageField extends StatelessWidget {
  const ChatMessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBotCubit, ChatBotState>(
      builder: (context, state) {
        final cubit = context.read<ChatBotCubit>();
        final formManager = cubit.formManager;
        return CustomTextFormField(
          hintText: 'Type here...',
          controller: formManager.messageController.controller,
          validator: cubit.validateMessage,
          onFieldSubmit: (_) => cubit.sendMessage(),
        );
      },
    );
  }
}
