import 'package:equatable/equatable.dart';
import 'chat_file_entity.dart';

class ChatMessageEntity extends Equatable {
  final String content;
  final bool isUser;
  final String chatId;
  final List<ChatFileEntity> files;
  final String id;
  final String createdAt;
  final bool isDeleted;

  const ChatMessageEntity({
    required this.content,
    required this.isUser,
    required this.chatId,
    required this.files,
    required this.id,
    required this.createdAt,
    required this.isDeleted,
  });

  @override
  List<Object?> get props => [
        content,
        isUser,
        chatId,
        files,
        id,
        createdAt,
        isDeleted,
      ];
}
