import '../../../../core/functions/convert_and_parse_messages.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/entities/send_message_request_entity.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/entities/chat_file_entity.dart';
import '../models/requests/send_message_request_model.dart';
import '../models/responses/send_message_response_model.dart';

class ChatBotDataMapper {
  static SendMessageRequestModel toRequestModel(
    SendMessageRequestEntity entity,
  ) {
    return SendMessageRequestModel(
      message: entity.message,
      chatId: entity.chatId,
      files: entity.files,
    );
  }

  static MessageEntity toMessageEntity(
    SendMessageResponseModel model,
  ) {
    final chatMessageEntity = _convertResponseToChatMessageEntity(model);
    final messages = convertChatMessagesToMessages([chatMessageEntity]);
    final message = messages.first;

    return MessageEntity(
      isUser: message.isUser,
      content: message.message,
      date: message.date,
      options: message.options,
      hasObservations: message.hasObservations,
      observations: message.observations,
      chatId: message.chatId,
      id: message.id,
      files: message.files,
    );
  }

  static ChatMessageEntity _convertResponseToChatMessageEntity(
    SendMessageResponseModel response,
  ) {
    return ChatMessageEntity(
      content: response.content,
      isUser: response.isUser,
      chatId: response.chatId,
      files: response.files
          .map((fileUrl) => ChatFileEntity(
                fileUrl: fileUrl,
                id: '',
                createdAt: response.createdAt,
                isDeleted: false,
              ))
          .toList(),
      id: response.id,
      createdAt: response.createdAt,
      isDeleted: response.isDeleted,
    );
  }
}
