// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_family_group_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFamilyGroupResponseModel _$CreateFamilyGroupResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateFamilyGroupResponseModel(
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$CreateFamilyGroupResponseModelToJson(
        CreateFamilyGroupResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

CreateFamilyGroupWrapper _$CreateFamilyGroupWrapperFromJson(
        Map<String, dynamic> json) =>
    CreateFamilyGroupWrapper(
      familyGroup: CreateFamilyGroupResponseModel.fromJson(
          json['familyGroup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateFamilyGroupWrapperToJson(
        CreateFamilyGroupWrapper instance) =>
    <String, dynamic>{
      'familyGroup': instance.familyGroup,
    };
