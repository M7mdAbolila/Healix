import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_error_model.dart';
import '../entities/message_entity.dart';
import '../entities/send_message_request_entity.dart';
import '../entities/get_all_chats_response_entity.dart';

abstract class ChatBotRepository {
  Future<Either<ApiErrorModel, MessageEntity>> sendMessage(
    SendMessageRequestEntity request,
  );

  Future<Either<ApiErrorModel, GetAllChatsResponseEntity>> getAllChats();
}
