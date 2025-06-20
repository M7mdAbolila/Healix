// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFileModel _$ChatFileModelFromJson(Map<String, dynamic> json) =>
    ChatFileModel(
      fileUrl: json['fileUrl'] as String,
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$ChatFileModelToJson(ChatFileModel instance) =>
    <String, dynamic>{
      'fileUrl': instance.fileUrl,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };
