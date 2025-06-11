import 'package:equatable/equatable.dart';
import 'chat_entity.dart';

class GetAllChatsResponseEntity extends Equatable {
  final List<ChatEntity> chats;

  const GetAllChatsResponseEntity({
    required this.chats,
  });

  @override
  List<Object?> get props => [chats];
}
