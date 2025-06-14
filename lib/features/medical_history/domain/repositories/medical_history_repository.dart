import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/history_record_entity.dart';
import '../entities/get_medical_records_response_entity.dart';
import '../entities/patient_summary_entity.dart';
import '../entities/patient_summary_request_entity.dart';

abstract class MedicalHistoryRepository {
  Future<Either<ApiErrorModel, dynamic>> addHistoryRecord(
    HistoryRecordEntity historyRecord,
  );

  Future<Either<ApiErrorModel, GetMedicalRecordsResponseEntity>>
      getMedicalRecordsByType(
    int recordType,
  );

  Future<Either<ApiErrorModel, PatientSummaryEntity>> getPatientSummary(
    PatientSummaryRequestEntity request,
  );
}
