import 'dart:convert';

import '../../features/chat_bot/data/models/responses/chat_response.dart';
import '../../features/chat_bot/domain/entities/chat_message_entity.dart';
import '../../features/chat_bot/domain/entities/message.dart';
import '../../features/chat_bot/domain/entities/observation.dart';
import '../helpers/logging.dart';

List<Message> convertChatMessagesToMessages(
    List<ChatMessageEntity> chatMessages) {
  return chatMessages.map((chatMessage) {
    if (chatMessage.isUser) {
      // User messages don't need JSON parsing
      return Message(
        isUser: true,
        message: chatMessage.content,
        date: DateTime.parse(chatMessage.createdAt),
        chatId: chatMessage.chatId,
        id: chatMessage.id,
        files: chatMessage.files.map((file) => file.fileUrl).toList(),
        hasObservations: false,
      );
    } else {
      // Bot messages need JSON parsing similar to sendMessage method
      return _parseBotMessage(chatMessage);
    }
  }).toList();
}

/// Parse bot message content (similar to sendMessage parsing logic)
Message _parseBotMessage(ChatMessageEntity chatMessage) {
  String cleanedContent = chatMessage.content.trim();

  /// Remove markdown json wrapper if present
  if (cleanedContent.startsWith('json\n{') && cleanedContent.endsWith('}')) {
    cleanedContent = cleanedContent.substring(5);
  } else if (cleanedContent.startsWith('```json\n') &&
      cleanedContent.endsWith('\n```')) {
    cleanedContent = cleanedContent.substring(8, cleanedContent.length - 4);
  }

  try {
    final jsonData = jsonDecode(cleanedContent);
    final chatResponse = ChatResponse.fromJson(jsonData);

    return Message(
      isUser: false,
      message: chatResponse.text,
      date: DateTime.parse(chatMessage.createdAt),
      chatId: chatMessage.chatId,
      id: chatMessage.id,
      files: chatMessage.files.map((file) => file.fileUrl).toList(),
      options: chatResponse.options.isNotEmpty ? chatResponse.options : null,
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
  } catch (parseError) {
    /// If JSON parsing fails, return the raw content
    Logging.warn(
        'Failed to parse JSON content for message ${chatMessage.id}: $parseError');
    return Message(
      isUser: false,
      message: chatMessage.content,
      date: DateTime.parse(chatMessage.createdAt),
      chatId: chatMessage.chatId,
      id: chatMessage.id,
      files: chatMessage.files.map((file) => file.fileUrl).toList(),
      hasObservations: false,
    );
  }
}
