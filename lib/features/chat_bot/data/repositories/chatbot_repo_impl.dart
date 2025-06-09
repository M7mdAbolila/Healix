import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/helpers/logging.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/observation.dart';
import '../../domain/repositories/chat_repo.dart';
import '../datasources/chatbot_api_service.dart';
import '../models/requests/send_message_request.dart';
import '../models/responses/chat_response.dart';

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

      /// Parse the content which should be JSON
      String cleanedContent = response.content.trim();

      /// Remove markdown json wrapper if present
      if (cleanedContent.startsWith('json\n{') &&
          cleanedContent.endsWith('}')) {
        cleanedContent = cleanedContent.substring(5);
      } else if (cleanedContent.startsWith('```json\n') &&
          cleanedContent.endsWith('\n```')) {
        cleanedContent = cleanedContent.substring(8, cleanedContent.length - 4);
      }

      try {
        final jsonData = jsonDecode(cleanedContent);
        final chatResponse = ChatResponse.fromJson(jsonData);

        final domainMessage = Message(
          isUser: false,
          message: chatResponse.text,
          date: DateTime.parse(response.createdAt),
          chatId: response.chatId,
          id: response.id,
          files: response.files,
          options:
              chatResponse.options.isNotEmpty ? chatResponse.options : null,
          hasObservations: chatResponse.observations.isNotEmpty,
          observations: chatResponse.observations.isNotEmpty
              ? chatResponse.observations
                  .map((obs) => Observation(
                        condition: obs.condition,
                        probability: obs.probability,
                        description: obs.description,
                      ))
                  .toList()
              : null,
        );

        Logging.info('Message converted successfully');
        return right(domainMessage);
      } catch (parseError) {
        /// If JSON parsing fails, return the raw content
        Logging.warn('Failed to parse JSON content: $parseError');
        final domainMessage = Message(
          isUser: false,
          message: response.content,
          date: DateTime.parse(response.createdAt),
          chatId: response.chatId,
          id: response.id,
          files: response.files,
          hasObservations: false,
        );
        return right(domainMessage);
      }
    } catch (error) {
      Logging.error('Error occurred: $error');
      return left(ApiErrorHandler.handle(error));
    }
  }
}
