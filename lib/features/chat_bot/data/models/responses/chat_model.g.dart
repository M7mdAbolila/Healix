// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      lastMessage: ChatMessageModel.fromJson(
          json['lastMessage'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
      'lastMessage': instance.lastMessage,
      'messages': instance.messages,
    };
