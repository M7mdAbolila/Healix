import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/helpers/logging.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/entities/send_message_request_entity.dart';
import '../../domain/entities/get_all_chats_response_entity.dart';
import '../../domain/repositories/chat_bot_repository.dart';
import '../datasources/chatbot_api_service.dart';
import '../mappers/chat_bot_data_mapper.dart';

class ChatBotRepositoryImpl implements ChatBotRepository {
  final ChatbotApiService _apiService;

  ChatBotRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiErrorModel, MessageEntity>> sendMessage(
    SendMessageRequestEntity request,
  ) async {
    try {
      final requestModel = ChatBotDataMapper.toRequestModel(request);
      final formData = await requestModel.toFormData();

      Logging.info(
          'Sending chat request: message=${request.message}, chatId=${request.chatId}');
      if (request.files != null && request.files!.isNotEmpty) {
        Logging.info('Number of files: ${request.files!.length}');
        for (var file in request.files!) {
          Logging.info('File: ${file.path}');
        }
      }

      final response = await _apiService.sendMessage(formData);
      Logging.info('Chat response received: ${response.content}');

      final messageEntity = ChatBotDataMapper.toMessageEntity(response);

      Logging.info('Message converted successfully');
      return right(messageEntity);
    } catch (error) {
      Logging.error('Error occurred: $error');
      return left(ApiErrorHandler.handle(error));
    }
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
