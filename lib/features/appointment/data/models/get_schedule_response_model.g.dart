// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_schedule_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetScheduleResponseModel _$GetScheduleResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetScheduleResponseModel(
      schedule: json['schedule'] == null
          ? null
          : ScheduleModel.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetScheduleResponseModelToJson(
        GetScheduleResponseModel instance) =>
    <String, dynamic>{
      'schedule': instance.schedule,
    };
