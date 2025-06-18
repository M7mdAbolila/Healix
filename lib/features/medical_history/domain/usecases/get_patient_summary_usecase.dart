import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/patient_summary_entity.dart';
import '../entities/patient_summary_request_entity.dart';
import '../repositories/medical_history_repository.dart';

class GetPatientSummaryUseCase {
  final MedicalHistoryRepository _repository;

  GetPatientSummaryUseCase(this._repository);

  Future<Either<ApiErrorModel, PatientSummaryEntity>> call(
    PatientSummaryRequestEntity request,
  ) async {
    return await _repository.getPatientSummary(request);
  }
}
