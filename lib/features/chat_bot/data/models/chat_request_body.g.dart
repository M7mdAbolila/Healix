// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRequestBody _$ChatRequestBodyFromJson(Map<String, dynamic> json) =>
    ChatRequestBody(
      history: (json['history'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$ChatRequestBodyToJson(ChatRequestBody instance) =>
    <String, dynamic>{
      'history': instance.history,
    };
