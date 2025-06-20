// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentResponseModel _$BookAppointmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    BookAppointmentResponseModel(
      appointment: json['appointment'] == null
          ? null
          : AppointmentDetailsModel.fromJson(
              json['appointment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookAppointmentResponseModelToJson(
        BookAppointmentResponseModel instance) =>
    <String, dynamic>{
      'appointment': instance.appointment,
    };

AppointmentDetailsModel _$AppointmentDetailsModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentDetailsModel(
      status: json['status'] as num?,
      day: json['day'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$AppointmentDetailsModelToJson(
        AppointmentDetailsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'day': instance.day,
      'from': instance.from,
      'to': instance.to,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };
