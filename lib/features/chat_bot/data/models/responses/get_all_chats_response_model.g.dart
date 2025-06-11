// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_chats_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllChatsResponseModel _$GetAllChatsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllChatsResponseModel(
      chats: (json['chats'] as List<dynamic>)
          .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllChatsResponseModelToJson(
        GetAllChatsResponseModel instance) =>
    <String, dynamic>{
      'chats': instance.chats,
    };
