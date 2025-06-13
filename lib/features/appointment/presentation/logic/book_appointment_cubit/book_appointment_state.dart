part of 'book_appointment_cubit.dart';

abstract class BookAppointmentState extends Equatable {
  const BookAppointmentState();

  @override
  List<Object?> get props => [];
}

class BookAppointmentInitial extends BookAppointmentState {
  const BookAppointmentInitial();
}

class BookAppointmentLoading extends BookAppointmentState {
  const BookAppointmentLoading();
}

class BookAppointmentSuccess extends BookAppointmentState {
  final BookAppointmentResponseEntity response;
  const BookAppointmentSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class BookAppointmentError extends BookAppointmentState {
  final String errMessage;
  const BookAppointmentError(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
