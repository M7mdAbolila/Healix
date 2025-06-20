class BookAppointmentResponseEntity {
  final AppointmentDetailsEntity? appointment;

  const BookAppointmentResponseEntity({
    this.appointment,
  });
}

class AppointmentDetailsEntity {
  final num? status;
  final String? day;
  final String? from;
  final String? to;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const AppointmentDetailsEntity({
    this.status,
    this.day,
    this.from,
    this.to,
    this.id,
    this.createdAt,
    this.isDeleted,
  });
}
