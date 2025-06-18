import 'package:equatable/equatable.dart';
import '../../../domain/entities/entities.dart';

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
  final String errorMessage;

  const BookAppointmentError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class BookAppointmentValidationError extends BookAppointmentState {
  final Map<String, String> fieldErrors;

  const BookAppointmentValidationError(this.fieldErrors);

  @override
  List<Object?> get props => [fieldErrors];
}
