import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/entities.dart';

part 'book_appointment_request_model.g.dart';

@JsonSerializable()
class BookAppointmentRequestModel extends BookAppointmentRequestEntity {
  const BookAppointmentRequestModel({
    required super.day,
    required super.from,
    required super.to,
    required super.doctorId,
  });

  factory BookAppointmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentRequestModelToJson(this);
}
