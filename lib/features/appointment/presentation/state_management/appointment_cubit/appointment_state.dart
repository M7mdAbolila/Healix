import 'package:equatable/equatable.dart';
import '../../../domain/entities/entities.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object?> get props => [];
}

class AppointmentInitial extends AppointmentState {
  const AppointmentInitial();
}

class GetDoctorsLoading extends AppointmentState {
  const GetDoctorsLoading();
}

class GetDoctorsSuccess extends AppointmentState {
  final GetDoctorsResponseEntity response;
  
  const GetDoctorsSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class GetDoctorsError extends AppointmentState {
  final String errorMessage;
  
  const GetDoctorsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class GetDoctorsValidationError extends AppointmentState {
  final Map<String, String> fieldErrors;

  const GetDoctorsValidationError(this.fieldErrors);

  @override
  List<Object?> get props => [fieldErrors];
}
