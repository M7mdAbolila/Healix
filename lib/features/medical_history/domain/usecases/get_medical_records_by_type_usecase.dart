import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/get_medical_records_response_entity.dart';
import '../repositories/medical_history_repository.dart';

class GetMedicalRecordsByTypeUseCase {
  final MedicalHistoryRepository _repository;

  GetMedicalRecordsByTypeUseCase(this._repository);

  Future<Either<ApiErrorModel, GetMedicalRecordsResponseEntity>> call(
    int recordType,
  ) async {
    return await _repository.getMedicalRecordsByType(recordType);
  }
}
