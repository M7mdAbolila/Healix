class BookAppointmentRequestEntity {
  final String day;
  final String from;
  final String to;
  final String doctorId;

  const BookAppointmentRequestEntity({
    required this.day,
    required this.from,
    required this.to,
    required this.doctorId,
  });
}
