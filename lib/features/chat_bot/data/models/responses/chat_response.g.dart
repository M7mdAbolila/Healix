// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
      text: json['text'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      observations: (json['observations'] as List<dynamic>)
          .map((e) => ObservationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'options': instance.options,
      'observations': instance.observations,
    };

ObservationResponse _$ObservationResponseFromJson(Map<String, dynamic> json) =>
    ObservationResponse(
      condition: json['condition'] as String,
      probability: json['probability'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ObservationResponseToJson(
        ObservationResponse instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'probability': instance.probability,
      'description': instance.description,
    };
