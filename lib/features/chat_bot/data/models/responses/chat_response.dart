import 'package:json_annotation/json_annotation.dart';
part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse {
  final String text;
  final List<String> options;
  final List<ObservationResponse> observations;

  ChatResponse({
    required this.text,
    required this.options,
    required this.observations,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}

@JsonSerializable()
class ObservationResponse {
  final String condition;
  final String probability;
  final String description;

  ObservationResponse({
    required this.condition,
    required this.probability,
    required this.description,
  });

  factory ObservationResponse.fromJson(Map<String, dynamic> json) =>
      _$ObservationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ObservationResponseToJson(this);
}
