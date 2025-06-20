import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/entities.dart';

part 'book_appointment_response_model.g.dart';

@JsonSerializable()
class BookAppointmentResponseModel extends BookAppointmentResponseEntity {
  @override
  final AppointmentDetailsModel? appointment;

  const BookAppointmentResponseModel({
    this.appointment,
  }) : super(appointment: appointment);

  factory BookAppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentResponseModelToJson(this);
}

@JsonSerializable()
class AppointmentDetailsModel extends AppointmentDetailsEntity {
  const AppointmentDetailsModel({
    super.status,
    super.day,
    super.from,
    super.to,
    super.id,
    super.createdAt,
    super.isDeleted,
  });

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDetailsModelToJson(this);
}
