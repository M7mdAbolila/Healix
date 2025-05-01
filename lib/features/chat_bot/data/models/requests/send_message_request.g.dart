// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) =>
    SendMessageRequest(
      contents: (json['contents'] as List<dynamic>)
          .map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      generationConfig: GenerationConfig.fromJson(
          json['generationConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendMessageRequestToJson(SendMessageRequest instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'generationConfig': instance.generationConfig,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      role: json['role'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'role': instance.role,
      'parts': instance.parts,
    };

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      text: json['text'] as String?,
      inlineData: json['inlineData'] == null
          ? null
          : InlineData.fromJson(json['inlineData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'text': instance.text,
      'inlineData': instance.inlineData,
    };

InlineData _$InlineDataFromJson(Map<String, dynamic> json) => InlineData(
      mimeType: json['mimeType'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$InlineDataToJson(InlineData instance) =>
    <String, dynamic>{
      'mimeType': instance.mimeType,
      'data': instance.data,
    };

GenerationConfig _$GenerationConfigFromJson(Map<String, dynamic> json) =>
    GenerationConfig(
      temperature: (json['temperature'] as num).toDouble(),
      topP: (json['topP'] as num).toDouble(),
      maxOutputTokens: (json['maxOutputTokens'] as num).toInt(),
    );

Map<String, dynamic> _$GenerationConfigToJson(GenerationConfig instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'topP': instance.topP,
      'maxOutputTokens': instance.maxOutputTokens,
    };
