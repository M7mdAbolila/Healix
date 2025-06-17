import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../../../../core/domain/services/input_validation_service.dart';
import '../../../../../core/presentation/form/form_manager.dart';
import '../../../../../core/helpers/logging.dart';
import '../../../domain/entities/message_entity.dart';
import '../../../domain/entities/send_message_request_entity.dart';
import '../../../domain/usecases/send_message_usecase.dart';
import 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final SendMessageUseCase _sendMessageUseCase;
  final InputValidationService _validationService;
  final ChatFormManager _formManager;

  ChatBotCubit({
    required SendMessageUseCase sendMessageUseCase,
    required InputValidationService validationService,
    required ChatFormManager formManager,
  })  : _sendMessageUseCase = sendMessageUseCase,
        _validationService = validationService,
        _formManager = formManager,
        super(const ChatBotInitial());

  ChatFormManager get formManager => _formManager;

  List<MessageEntity> messages = [];
  List<String> options = [];
  String? currentChatId;
  List<File> selectedFiles = [];

  String? validateMessage(String? message) =>
      _validationService.validateChatMessage(message);

  void startNewChat() {
    Logging.info('Starting new chat');
    currentChatId = null;
    messages.clear();
    options.clear();
    selectedFiles.clear();
    _formManager.clearForm();
    emit(const ChatBotInitial());
  }

  void setExistingChatId(String chatId) {
    currentChatId = chatId;
    emit(const ChatBotInitial());
  }

  void loadMessages(List<MessageEntity> chatMessages, String chatId) {
    currentChatId = chatId;
    messages.clear();
    messages.addAll(chatMessages);

    final lastBotMessage = chatMessages
        .where((msg) =>
            !msg.isUser && msg.options != null && msg.options!.isNotEmpty)
        .lastOrNull;

    if (lastBotMessage != null) {
      options = lastBotMessage.options ?? [];
    } else {
      options.clear();
    }

    emit(const ChatBotInitial());
  }

  Future<void> sendMessage({String? option}) async {
    final validationErrors = _validateMessage(option);
    if (validationErrors.isNotEmpty) {
      emit(ChatBotValidationError(validationErrors));
      return;
    }

    emit(const ChatBotLoading());

    try {
      final messageText = option ?? _formManager.messageController.value;

      final request = SendMessageRequestEntity(
        message: messageText,
        chatId: currentChatId,
        files: selectedFiles.isNotEmpty ? selectedFiles : null,
      );

      final userMessage = MessageEntity(
        isUser: true,
        content: messageText,
        date: DateTime.now(),
        chatId: currentChatId,
        files: selectedFiles.isNotEmpty
            ? selectedFiles.map((f) => f.path.split('/').last).toList()
            : null,
      );

      messages.add(userMessage);

      _formManager.clearForm();
      selectedFiles.clear();

      final result = await _sendMessageUseCase.call(request);

      result.fold(
        (error) => emit(ChatBotFailure(error.errMessage)),
        (messageEntity) {
          if (currentChatId == null && messageEntity.chatId != null) {
            currentChatId = messageEntity.chatId;
          }

          messages.add(messageEntity);
          options = messageEntity.options ?? [];
          emit(ChatBotSuccess(messageEntity));
        },
      );
    } catch (e) {
      emit(const ChatBotFailure(
          'An unexpected error occurred. Please try again.'));
    }
  }

  Future<void> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null && result.files.isNotEmpty) {
        const maxFileSize = 25 * 1024 * 1024; // 25MB
        final validFiles = result.files
            .where((file) => file.size <= maxFileSize)
            .map((file) => File(file.path!))
            .toList();

        selectedFiles.clear();
        selectedFiles.addAll(validFiles);

        if (selectedFiles.isNotEmpty) {
          emit(ChatBotFilesSelected(
            selectedFiles.map((f) => f.path.split('/').last).toList(),
          ));
        }
      }
    } catch (e) {
      emit(const ChatBotFailure('Error selecting files. Please try again.'));
    }
  }

  void removeFile(File file) {
    selectedFiles.remove(file);
    if (selectedFiles.isEmpty) {
      emit(const ChatBotInitial());
    } else {
      emit(ChatBotFilesSelected(
        selectedFiles.map((f) => f.path.split('/').last).toList(),
      ));
    }
  }

  void clearSelectedFiles() {
    selectedFiles.clear();
    emit(const ChatBotInitial());
  }

  Map<String, String> _validateMessage(String? option) {
    final errors = <String, String>{};

    final messageText = option ?? _formManager.messageController.value;
    final messageError = _validationService.validateChatMessage(messageText);

    if (messageError != null && selectedFiles.isEmpty) {
      errors['message'] = messageError;
    }

    return errors;
  }

  void clearForm() {
    _formManager.clearForm();
    selectedFiles.clear();
    emit(const ChatBotInitial());
  }

  @override
  Future<void> close() {
    _formManager.dispose();
    return super.close();
  }
}
