import 'package:equatable/equatable.dart';
import 'chat_message_entity.dart';

class ChatEntity extends Equatable {
  final ChatMessageEntity lastMessage;
  final List<ChatMessageEntity> messages;
  final String id;
  final String createdAt;
  final bool isDeleted;

  const ChatEntity({
    required this.lastMessage,
    required this.messages,
    required this.id,
    required this.createdAt,
    required this.isDeleted,
  });

  @override
  List<Object?> get props => [
        lastMessage,
        messages,
        id,
        createdAt,
        isDeleted,
      ];
}
