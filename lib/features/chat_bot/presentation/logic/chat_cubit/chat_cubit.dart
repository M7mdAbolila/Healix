import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/message.dart';
import '../../../domain/usecases/send_message_use_case.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase _sendMessageUseCase;

  ChatCubit(this._sendMessageUseCase) : super(ChatInitial());

  List<Message> messages = [];
  final messageController = TextEditingController();
  final String currentTime = DateFormat('HH:mm').format(DateTime.now());
  List<String> options = [];

  Future<void> sendMessage({
    List<String>? images,
    String? option,
  }) async {
    final userInput = option ?? messageController.text.trim();
    if (userInput.isEmpty &&
        (images == null || images.isEmpty) &&
        option == null) {
      return;
    }

    final userMessage = Message(
      isUser: true,
      message: userInput,
      date: DateTime.now(),
      images: images,
    );

    messages.add(userMessage);
    emit(ChatLoading());

    final response = await _sendMessageUseCase(
      userInput: userInput,
      conversationHistory: messages,
      images: images,
    );

    response.fold(
      (failure) {
        messages.add(Message(
          isUser: false,
          message: failure.errMessage,
          date: DateTime.now(),
          hasObservations: false,
        ));
        emit(ChatFailure());
      },
      (botMessage) {
        messages.add(botMessage);
        options = botMessage.options ?? [];
        emit(ChatSuccess());
      },
    );

    messageController.clear();
  }
}
