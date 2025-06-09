// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_family_group_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFamilyGroupResponseModel _$GetFamilyGroupResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetFamilyGroupResponseModel(
      familyGroup: json['familyGroup'] == null
          ? null
          : FamilyGroupModel.fromJson(
              json['familyGroup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetFamilyGroupResponseModelToJson(
        GetFamilyGroupResponseModel instance) =>
    <String, dynamic>{
      'familyGroup': instance.familyGroup,
    };
