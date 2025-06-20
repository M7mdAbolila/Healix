import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/chat_message_entity.dart';
import 'chat_file_model.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel extends ChatMessageEntity {
  @override
  @JsonKey(name: 'files')
  final List<ChatFileModel> files;

  const ChatMessageModel({
    required super.content,
    required super.isUser,
    required super.chatId,
    required this.files,
    required super.id,
    required super.createdAt,
    required super.isDeleted,
  }) : super(files: files);

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}
