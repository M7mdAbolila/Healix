import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/helpers/logging.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/functions/convert_and_parse_messages.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/get_all_chats_response_entity.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/entities/chat_file_entity.dart';
import '../../domain/repositories/chat_repo.dart';
import '../datasources/chatbot_api_service.dart';
import '../models/requests/send_message_request.dart';
import '../models/responses/send_message_response_model.dart';

class ChatbotRepoImpl implements ChatRepo {
  final ChatbotApiService _apiService;

  ChatbotRepoImpl(this._apiService);
  @override
  Future<Either<ApiErrorModel, Message>> sendMessage({
    required String message,
    String? chatId,
    List<MultipartFile>? files,
  }) async {
    try {
      final request = SendMessageRequest(
        message: message,
        chatId: chatId,
        files: files,
      );
      final formData = request.toFormData();

      // Debug logging
      Logging.info('Sending chat request: message=$message, chatId=$chatId');
      if (files != null && files.isNotEmpty) {
        Logging.info('Number of files: ${files.length}');
        for (var file in files) {
          Logging.info(
              'File: ${file.filename}, ContentType: ${file.contentType}');
        }
      }

      final response = await _apiService.sendMessage(formData);
      Logging.info('Chat response received: ${response.content}');

      // Convert response to ChatMessageEntity and use the existing parsing logic
      final chatMessageEntity = _convertResponseToChatMessageEntity(response);
      final messages = convertChatMessagesToMessages([chatMessageEntity]);

      Logging.info('Message converted successfully');
      return right(messages.first);
    } catch (error) {
      Logging.error('Error occurred: $error');
      return left(ApiErrorHandler.handle(error));
    }
  }

  /// Helper method to convert SendMessageResponseModel to ChatMessageEntity
  ChatMessageEntity _convertResponseToChatMessageEntity(
      SendMessageResponseModel response) {
    return ChatMessageEntity(
      content: response.content,
      isUser: response.isUser,
      chatId: response.chatId,
      files: response.files
          .map((fileUrl) => ChatFileEntity(
                fileUrl: fileUrl,
                id: '', // Not provided in response
                createdAt: response.createdAt,
                isDeleted: false,
              ))
          .toList(),
      id: response.id,
      createdAt: response.createdAt,
      isDeleted: response.isDeleted,
    );
  }

  @override
  Future<Either<ApiErrorModel, GetAllChatsResponseEntity>> getAllChats() async {
    try {
      Logging.info('Fetching all chats');
      final response = await _apiService.getAllChats();
      Logging.info(
          'All chats fetched successfully: ${response.chats.length} chats');
      return right(response);
    } catch (error) {
      Logging.error('Error fetching all chats: $error');
      return left(ApiErrorHandler.handle(error));
    }
  }
}
