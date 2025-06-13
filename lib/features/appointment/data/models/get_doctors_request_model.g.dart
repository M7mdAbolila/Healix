// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctors_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorsRequestModel _$GetDoctorsRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetDoctorsRequestModel(
      doctorSpeciality: (json['doctorSpeciality'] as num).toInt(),
    );

Map<String, dynamic> _$GetDoctorsRequestModelToJson(
        GetDoctorsRequestModel instance) =>
    <String, dynamic>{
      'doctorSpeciality': instance.doctorSpeciality,
    };
