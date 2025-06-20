import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/chat_entity.dart';
import 'chat_message_model.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel extends ChatEntity {
  @override
  @JsonKey(name: 'lastMessage')
  final ChatMessageModel lastMessage;

  @override
  @JsonKey(name: 'messages')
  final List<ChatMessageModel> messages;

  const ChatModel({
    required this.lastMessage,
    required this.messages,
    required super.id,
    required super.createdAt,
    required super.isDeleted,
  }) : super(
          lastMessage: lastMessage,
          messages: messages,
        );

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
