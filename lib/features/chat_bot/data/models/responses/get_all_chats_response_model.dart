import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/get_all_chats_response_entity.dart';
import 'chat_model.dart';

part 'get_all_chats_response_model.g.dart';

@JsonSerializable()
class GetAllChatsResponseModel extends GetAllChatsResponseEntity {
  @override
  @JsonKey(name: 'chats')
  final List<ChatModel> chats;

  const GetAllChatsResponseModel({
    required this.chats,
  }) : super(chats: chats);

  factory GetAllChatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllChatsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllChatsResponseModelToJson(this);
}
