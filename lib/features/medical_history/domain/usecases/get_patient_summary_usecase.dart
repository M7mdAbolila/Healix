import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/patient_summary_entity.dart';
import '../entities/patient_summary_request_entity.dart';
import '../repositories/medical_history_repository.dart';

class GetPatientSummaryUseCase {
  final MedicalHistoryRepository repository;

  GetPatientSummaryUseCase(this.repository);

  Future<Either<ApiErrorModel, PatientSummaryEntity>> call(
    PatientSummaryRequestEntity request,
  ) async {
    return await repository.getPatientSummary(request);
  }
}
