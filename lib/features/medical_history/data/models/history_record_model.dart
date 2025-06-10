import 'package:dio/dio.dart';
import 'dart:convert';
import '../../domain/entities/history_record_entity.dart';
import 'medicine_model.dart';

class HistoryRecordModel extends HistoryRecordEntity {
  @override
  final List<MedicineModel>? medicines;

  const HistoryRecordModel({
    super.notes,
    super.doctorName,
    super.date,
    super.speciality,
    super.clinicName,
    super.medicalHistoryType,
    super.isFirstTime,
    super.medicalDiagnoses,
    super.scanType,
    super.scanName,
    super.facilityName,
    super.scannedPart,
    super.procedureName,
    super.testName,
    super.logType,
    super.diseaseName,
    super.supervisedBy,
    super.riskLevel,
    super.lastTimeDiagnosed,
    super.familyInfectionSpreadLevel,
    super.allergen,
    super.allergyStatus,
    super.reactionSeverity,
    super.files,
    this.medicines,
  }) : super(medicines: medicines);

  Future<FormData> toFormData() async {
    final formData = FormData.fromMap({
      if (notes != null) 'Notes': notes,
      if (doctorName != null) 'DoctorName': doctorName,
      if (date != null) 'Date': date!.toIso8601String(),
      if (speciality != null) 'Speciality': speciality,
      if (clinicName != null) 'ClinicName': clinicName,
      if (medicalHistoryType != null) 'MedicalHistoryType': medicalHistoryType,
      if (isFirstTime != null) 'IsFirstTime': isFirstTime,
      if (medicalDiagnoses != null) 'MedicalDiagnoses': medicalDiagnoses,
      if (scanType != null) 'ScanType': scanType,
      if (scanName != null) 'ScanName': scanName,
      if (facilityName != null) 'FacilityName': facilityName,
      if (scannedPart != null) 'ScannedPart': scannedPart,
      if (procedureName != null) 'ProcedureName': procedureName,
      if (testName != null) 'TestName': testName,
      if (logType != null) 'LogType': logType,
      if (diseaseName != null) 'DiseaseName': diseaseName,
      if (supervisedBy != null) 'SupervisedBy': supervisedBy,
      if (riskLevel != null) 'RiskLevel': riskLevel,
      if (lastTimeDiagnosed != null) 'LastTimeDiagnosed': lastTimeDiagnosed,
      if (familyInfectionSpreadLevel != null)
        'FamilyInfectionSpreadLevel': familyInfectionSpreadLevel,
      if (allergen != null) 'Allergen': allergen,
      if (allergyStatus != null) 'AllergyStatus': allergyStatus,
      if (reactionSeverity != null) 'ReactionSeverity': reactionSeverity,
    });

    if (medicines != null && medicines!.isNotEmpty) {
      final medicinesJson =
          medicines!.map((medicine) => medicine.toJson()).toList();
      formData.fields.add(MapEntry('Medicines', jsonEncode(medicinesJson)));
    }

    if (files != null && files!.isNotEmpty) {
      for (int i = 0; i < files!.length; i++) {
        final file = files![i];
        formData.files.add(
          MapEntry(
            'Files',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }
    }

    return formData;
  }
}
