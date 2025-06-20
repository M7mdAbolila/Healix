import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/chat_file_entity.dart';

part 'chat_file_model.g.dart';

@JsonSerializable()
class ChatFileModel extends ChatFileEntity {
  const ChatFileModel({
    required super.fileUrl,
    required super.id,
    required super.createdAt,
    required super.isDeleted,
  });

  factory ChatFileModel.fromJson(Map<String, dynamic> json) =>
      _$ChatFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatFileModelToJson(this);
}
