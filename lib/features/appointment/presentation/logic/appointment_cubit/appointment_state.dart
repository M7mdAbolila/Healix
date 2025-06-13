part of 'appointment_cubit.dart';

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
  final String errMessage;
  const GetDoctorsError(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
