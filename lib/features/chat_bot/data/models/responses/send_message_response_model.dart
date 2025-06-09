import 'package:json_annotation/json_annotation.dart';

part 'send_message_response_model.g.dart';

@JsonSerializable()
class SendMessageResponseModel {
  final String content;
  final bool isUser;
  final String chatId;
  final List<String> files;
  final String id;
  final String createdAt;
  final bool isDeleted;

  SendMessageResponseModel({
    required this.content,
    required this.isUser,
    required this.chatId,
    required this.files,
    required this.id,
    required this.createdAt,
    required this.isDeleted,
  });

  factory SendMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageResponseModelToJson(this);
}
