import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/patient_summary_request_entity.dart';
import '../../../domain/usecases/get_patient_summary_usecase.dart';
import 'patient_summary_state.dart';

class PatientSummaryCubit extends Cubit<PatientSummaryState> {
  final GetPatientSummaryUseCase _getPatientSummaryUseCase;

  PatientSummaryCubit({
    required GetPatientSummaryUseCase getPatientSummaryUseCase,
  })  : _getPatientSummaryUseCase = getPatientSummaryUseCase,
        super(const PatientSummaryInitial());

  Future<void> getPatientSummary({String? patientId}) async {
    emit(const PatientSummaryLoading());

    try {
      final request = PatientSummaryRequestEntity(patientId: patientId);
      final result = await _getPatientSummaryUseCase.call(request);

      result.fold(
        (error) => emit(PatientSummaryError(error.errMessage)),
        (patientSummary) => emit(PatientSummarySuccess(patientSummary)),
      );
    } catch (e) {
      emit(
          PatientSummaryError('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
