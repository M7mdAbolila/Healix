// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      content: json['content'] as String,
      isUser: json['isUser'] as bool,
      chatId: json['chatId'] as String,
      files: (json['files'] as List<dynamic>)
          .map((e) => ChatFileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'isUser': instance.isUser,
      'chatId': instance.chatId,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
      'files': instance.files,
    };
