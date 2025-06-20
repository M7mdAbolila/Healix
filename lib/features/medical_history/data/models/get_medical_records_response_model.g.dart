// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_medical_records_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMedicalRecordsResponseModel _$GetMedicalRecordsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetMedicalRecordsResponseModel(
      records: (json['records'] as List<dynamic>)
          .map((e) => MedicalRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMedicalRecordsResponseModelToJson(
        GetMedicalRecordsResponseModel instance) =>
    <String, dynamic>{
      'records': instance.records,
    };
