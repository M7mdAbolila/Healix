import 'package:json_annotation/json_annotation.dart';
part 'send_message_request.g.dart';

@JsonSerializable()
class SendMessageRequest {
  final List<Content> contents;
  final GenerationConfig generationConfig;

  SendMessageRequest({
    required this.contents,
    required this.generationConfig,
  });

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);
}

@JsonSerializable()
class Content {
  final String role;
  final List<Part> parts;

  Content({
    required this.role,
    required this.parts,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Part {
  final String? text;
  final InlineData? inlineData;

  Part({this.text, this.inlineData});

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);
}

@JsonSerializable()
class InlineData {
  final String mimeType;
  final String data;

  InlineData({
    required this.mimeType,
    required this.data,
  });

  factory InlineData.fromJson(Map<String, dynamic> json) =>
      _$InlineDataFromJson(json);

  Map<String, dynamic> toJson() => _$InlineDataToJson(this);
}

@JsonSerializable()
class GenerationConfig {
  final double temperature;
  final double topP;
  final int maxOutputTokens;

  GenerationConfig({
    required this.temperature,
    required this.topP,
    required this.maxOutputTokens,
  });

  factory GenerationConfig.fromJson(Map<String, dynamic> json) =>
      _$GenerationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationConfigToJson(this);
}
