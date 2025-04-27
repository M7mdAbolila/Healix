import 'package:json_annotation/json_annotation.dart';

part 'chat_request_body.g.dart';

@JsonSerializable()
class ChatRequestBody {
  final List<Map<String, String>> history;

  ChatRequestBody({
    required this.history,
  });

  factory ChatRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRequestBodyToJson(this);
}
