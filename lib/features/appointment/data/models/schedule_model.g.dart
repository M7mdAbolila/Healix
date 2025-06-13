// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      doctorId: json['doctorId'] as String?,
      satFrom: json['satFrom'] as String?,
      satTo: json['satTo'] as String?,
      sunFrom: json['sunFrom'] as String?,
      sunTo: json['sunTo'] as String?,
      monFrom: json['monFrom'] as String?,
      monTo: json['monTo'] as String?,
      tueFrom: json['tueFrom'] as String?,
      tueTo: json['tueTo'] as String?,
      wedFrom: json['wedFrom'] as String?,
      wedTo: json['wedTo'] as String?,
      thuFrom: json['thuFrom'] as String?,
      thuTo: json['thuTo'] as String?,
      friFrom: json['friFrom'] as String?,
      friTo: json['friTo'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'satFrom': instance.satFrom,
      'satTo': instance.satTo,
      'sunFrom': instance.sunFrom,
      'sunTo': instance.sunTo,
      'monFrom': instance.monFrom,
      'monTo': instance.monTo,
      'tueFrom': instance.tueFrom,
      'tueTo': instance.tueTo,
      'wedFrom': instance.wedFrom,
      'wedTo': instance.wedTo,
      'thuFrom': instance.thuFrom,
      'thuTo': instance.thuTo,
      'friFrom': instance.friFrom,
      'friTo': instance.friTo,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };
