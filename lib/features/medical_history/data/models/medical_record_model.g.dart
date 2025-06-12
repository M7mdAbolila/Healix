// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordModel _$MedicalRecordModelFromJson(Map<String, dynamic> json) =>
    MedicalRecordModel(
      recordType: (json['recordType'] as num).toInt(),
      recordDto: json['recordDto'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$MedicalRecordModelToJson(MedicalRecordModel instance) =>
    <String, dynamic>{
      'recordType': instance.recordType,
      'recordDto': instance.recordDto,
    };
