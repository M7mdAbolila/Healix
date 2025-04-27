import 'package:json_annotation/json_annotation.dart';

part 'chat_response_model.g.dart';

@JsonSerializable()
class ChatResponseModel {
  final String reply;
  final List<String>? options;

  ChatResponseModel({
    required this.reply,
    this.options,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatResponseModelToJson(this);
}
