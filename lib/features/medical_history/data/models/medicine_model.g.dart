// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineModel _$MedicineModelFromJson(Map<String, dynamic> json) =>
    MedicineModel(
      medicineName: json['medicineName'] as String?,
      frequency: json['frequency'] as String?,
      endDate: json['endDate'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
    );

Map<String, dynamic> _$MedicineModelToJson(MedicineModel instance) =>
    <String, dynamic>{
      'medicineName': instance.medicineName,
      'frequency': instance.frequency,
      'endDate': instance.endDate,
      'startDate': instance.startDate?.toIso8601String(),
    };
