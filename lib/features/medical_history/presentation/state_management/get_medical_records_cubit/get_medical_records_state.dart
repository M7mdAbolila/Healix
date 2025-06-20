import 'package:equatable/equatable.dart';
import '../../../domain/entities/get_medical_records_response_entity.dart';

abstract class GetMedicalRecordsState extends Equatable {
  const GetMedicalRecordsState();

  @override
  List<Object?> get props => [];
}

class GetMedicalRecordsInitial extends GetMedicalRecordsState {
  const GetMedicalRecordsInitial();
}

class GetMedicalRecordsLoading extends GetMedicalRecordsState {
  const GetMedicalRecordsLoading();
}

class GetMedicalRecordsSuccess extends GetMedicalRecordsState {
  final GetMedicalRecordsResponseEntity response;

  const GetMedicalRecordsSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class GetMedicalRecordsError extends GetMedicalRecordsState {
  final String errMessage;

  const GetMedicalRecordsError(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
