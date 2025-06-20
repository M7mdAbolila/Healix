// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyGroupModel _$FamilyGroupModelFromJson(Map<String, dynamic> json) =>
    FamilyGroupModel(
      name: json['name'] as String?,
      code: json['code'] as String?,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => FamilyMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FamilyGroupModelToJson(FamilyGroupModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'id': instance.id,
      'members': instance.members,
    };
