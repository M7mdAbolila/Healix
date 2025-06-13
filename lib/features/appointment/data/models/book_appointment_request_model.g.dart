// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentRequestModel _$BookAppointmentRequestModelFromJson(
        Map<String, dynamic> json) =>
    BookAppointmentRequestModel(
      day: json['day'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      doctorId: json['doctorId'] as String,
    );

Map<String, dynamic> _$BookAppointmentRequestModelToJson(
        BookAppointmentRequestModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'from': instance.from,
      'to': instance.to,
      'doctorId': instance.doctorId,
    };
