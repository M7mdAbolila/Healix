import 'package:equatable/equatable.dart';
import '../../../domain/entities/patient_summary_entity.dart';

abstract class PatientSummaryState extends Equatable {
  const PatientSummaryState();

  @override
  List<Object?> get props => [];
}

class PatientSummaryInitial extends PatientSummaryState {
  const PatientSummaryInitial();
}

class PatientSummaryLoading extends PatientSummaryState {
  const PatientSummaryLoading();
}

class PatientSummarySuccess extends PatientSummaryState {
  final PatientSummaryEntity patientSummary;

  const PatientSummarySuccess(this.patientSummary);

  @override
  List<Object?> get props => [patientSummary];
}

class PatientSummaryError extends PatientSummaryState {
  final String errMessage;

  const PatientSummaryError(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
