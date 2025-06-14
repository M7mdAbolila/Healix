import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../domain/entities/history_record_entity.dart';
import '../../domain/entities/get_medical_records_response_entity.dart';
import '../../domain/entities/patient_summary_entity.dart';
import '../../domain/entities/patient_summary_request_entity.dart';
import '../../domain/repositories/medical_history_repository.dart';
import '../datasources/medical_history_api_service.dart';
import '../models/history_record_model.dart';
import '../models/medicine_model.dart';
import '../models/patient_summary_request_model.dart';

class MedicalHistoryRepositoryImpl implements MedicalHistoryRepository {
  final MedicalHistoryApiService _apiService;

  MedicalHistoryRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiErrorModel, dynamic>> addHistoryRecord(
    HistoryRecordEntity historyRecord,
  ) async {
    try {
      final historyRecordModel = HistoryRecordModel(
        notes: historyRecord.notes,
        doctorName: historyRecord.doctorName,
        date: historyRecord.date,
        speciality: historyRecord.speciality,
        clinicName: historyRecord.clinicName,
        medicalHistoryType: historyRecord.medicalHistoryType,
        isFirstTime: historyRecord.isFirstTime,
        medicalDiagnoses: historyRecord.medicalDiagnoses,
        scanType: historyRecord.scanType,
        scanName: historyRecord.scanName,
        facilityName: historyRecord.facilityName,
        scannedPart: historyRecord.scannedPart,
        procedureName: historyRecord.procedureName,
        testName: historyRecord.testName,
        logType: historyRecord.logType,
        diseaseName: historyRecord.diseaseName,
        supervisedBy: historyRecord.supervisedBy,
        riskLevel: historyRecord.riskLevel,
        lastTimeDiagnosed: historyRecord.lastTimeDiagnosed,
        familyInfectionSpreadLevel: historyRecord.familyInfectionSpreadLevel,
        allergen: historyRecord.allergen,
        allergyStatus: historyRecord.allergyStatus,
        reactionSeverity: historyRecord.reactionSeverity,
        files: historyRecord.files,
        medicines: historyRecord.medicines
            ?.map(
              (medicine) => MedicineModel(
                medicineName: medicine.medicineName,
                frequency: medicine.frequency,
                endDate: medicine.endDate,
                startDate: medicine.startDate,
              ),
            )
            .toList(),
      );
      final formData = await historyRecordModel.toFormData();
      final response = await _apiService.addHistoryRecord(formData);
      return right(response);
    } catch (error) {
      return left(
        ApiErrorHandler.handle(error),
      );
    }
  }
  @override
  Future<Either<ApiErrorModel, GetMedicalRecordsResponseEntity>>
      getMedicalRecordsByType(
    int recordType,
  ) async {
    try {
      final response = await _apiService.getMedicalRecordsByType(recordType);
      return right(response);
    } catch (error) {
      return left(
        ApiErrorHandler.handle(error),
      );
    }
  }
  @override
  Future<Either<ApiErrorModel, PatientSummaryEntity>> getPatientSummary(
    PatientSummaryRequestEntity request,
  ) async {
    try {
      final requestModel = PatientSummaryRequestModel(
        patientId: request.patientId,
      );
      final response = await _apiService.getPatientSummary(requestModel);
      return right(response);
    } catch (error) {
      return left(
        ApiErrorHandler.handle(error),
      );
    }
  }
}
