// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponseModel _$ChatResponseModelFromJson(Map<String, dynamic> json) =>
    ChatResponseModel(
      reply: json['reply'] as String,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChatResponseModelToJson(ChatResponseModel instance) =>
    <String, dynamic>{
      'reply': instance.reply,
      'options': instance.options,
    };
