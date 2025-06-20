// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageResponseModel _$SendMessageResponseModelFromJson(
        Map<String, dynamic> json) =>
    SendMessageResponseModel(
      content: json['content'] as String,
      isUser: json['isUser'] as bool,
      chatId: json['chatId'] as String,
      files: (json['files'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$SendMessageResponseModelToJson(
        SendMessageResponseModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'isUser': instance.isUser,
      'chatId': instance.chatId,
      'files': instance.files,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };
