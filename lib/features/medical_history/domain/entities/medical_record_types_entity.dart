import 'package:equatable/equatable.dart';

// Medical Visit Record (Type 0)
class MedicalVisitRecordEntity extends Equatable {
  final bool? isFirstTime;
  final String? doctorName;
  final String? speciality;
  final String? clinicName;
  final String? medicalDiagnoses;
  final String? prescription;
  final String? date;
  final String? notes;
  final String? patientId;
  final int? medicalHistoryType;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const MedicalVisitRecordEntity({
    this.isFirstTime,
    this.doctorName,
    this.speciality,
    this.clinicName,
    this.medicalDiagnoses,
    this.prescription,
    this.date,
    this.notes,
    this.patientId,
    this.medicalHistoryType,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        isFirstTime,
        doctorName,
        speciality,
        clinicName,
        medicalDiagnoses,
        prescription,
        date,
        notes,
        patientId,
        medicalHistoryType,
        id,
        createdAt,
        isDeleted,
      ];
}

// Lab Test Record (Type 1)
class LabTestRecordEntity extends Equatable {
  final String? testName;
  final String? speciality;
  final String? clinicName;
  final String? reports;
  final String? date;
  final String? notes;
  final String? patientId;
  final int? medicalHistoryType;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const LabTestRecordEntity({
    this.testName,
    this.speciality,
    this.clinicName,
    this.reports,
    this.date,
    this.notes,
    this.patientId,
    this.medicalHistoryType,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        testName,
        speciality,
        clinicName,
        reports,
        date,
        notes,
        patientId,
        medicalHistoryType,
        id,
        createdAt,
        isDeleted,
      ];
}

// X-Ray Record (Type 2)
class XRayRecordEntity extends Equatable {
  final String? scanType;
  final String? scanName;
  final String? facilityName;
  final String? scannedPart;
  final String? reports;
  final String? date;
  final String? notes;
  final String? patientId;
  final int? medicalHistoryType;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const XRayRecordEntity({
    this.scanType,
    this.scanName,
    this.facilityName,
    this.scannedPart,
    this.reports,
    this.date,
    this.notes,
    this.patientId,
    this.medicalHistoryType,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        scanType,
        scanName,
        facilityName,
        scannedPart,
        reports,
        date,
        notes,
        patientId,
        medicalHistoryType,
        id,
        createdAt,
        isDeleted,
      ];
}

// Surgery Record (Type 3)
class SurgeryRecordEntity extends Equatable {
  final String? speciality;
  final String? procedureName;
  final String? doctorName;
  final String? clinicName;
  final String? reports;
  final String? date;
  final String? notes;
  final String? patientId;
  final int? medicalHistoryType;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const SurgeryRecordEntity({
    this.speciality,
    this.procedureName,
    this.doctorName,
    this.clinicName,
    this.reports,
    this.date,
    this.notes,
    this.patientId,
    this.medicalHistoryType,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        speciality,
        procedureName,
        doctorName,
        clinicName,
        reports,
        date,
        notes,
        patientId,
        medicalHistoryType,
        id,
        createdAt,
        isDeleted,
      ];
}

// Allergy Record (Type 4)
class AllergyRecordEntity extends Equatable {
  final String? allergen;
  final int? reactionSeverity;
  final int? allergyStatus;
  final String? date;
  final String? notes;
  final String? patientId;
  final int? medicalHistoryType;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const AllergyRecordEntity({
    this.allergen,
    this.reactionSeverity,
    this.allergyStatus,
    this.date,
    this.notes,
    this.patientId,
    this.medicalHistoryType,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        allergen,
        reactionSeverity,
        allergyStatus,
        date,
        notes,
        patientId,
        medicalHistoryType,
        id,
        createdAt,
        isDeleted,
      ];
}

// Log Record (Type 5)
class LogRecordEntity extends Equatable {
  final String? logType;
  final String? speciality;
  final String? reports;
  final String? date;
  final String? notes;
  final String? patientId;
  final int? medicalHistoryType;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const LogRecordEntity({
    this.logType,
    this.speciality,
    this.reports,
    this.date,
    this.notes,
    this.patientId,
    this.medicalHistoryType,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        logType,
        speciality,
        reports,
        date,
        notes,
        patientId,
        medicalHistoryType,
        id,
        createdAt,
        isDeleted,
      ];
}

// Chronic Disease Record (Type 6)
class ChronicDiseaseRecordEntity extends Equatable {
  final String? speciality;
  final String? diseaseName;
  final int? riskLevel;
  final String? supervisedBy;
  final String? medicines;
  final String? reports;
  final String? date;
  final String? notes;
  final String? patientId;
  final int? medicalHistoryType;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const ChronicDiseaseRecordEntity({
    this.speciality,
    this.diseaseName,
    this.riskLevel,
    this.supervisedBy,
    this.medicines,
    this.reports,
    this.date,
    this.notes,
    this.patientId,
    this.medicalHistoryType,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        speciality,
        diseaseName,
        riskLevel,
        supervisedBy,
        medicines,
        reports,
        date,
        notes,
        patientId,
        medicalHistoryType,
        id,
        createdAt,
        isDeleted,
      ];
}

// Hereditary Disease Record (Type 7)
class HereditaryDiseaseRecordEntity extends Equatable {
  final String? speciality;
  final String? diseaseName;
  final String? lastTimeDiagnosed;
  final String? familyInfectionSpreadLevel;
  final String? medicines;
  final String? date;
  final String? notes;
  final String? patientId;
  final int? medicalHistoryType;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const HereditaryDiseaseRecordEntity({
    this.speciality,
    this.diseaseName,
    this.lastTimeDiagnosed,
    this.familyInfectionSpreadLevel,
    this.medicines,
    this.date,
    this.notes,
    this.patientId,
    this.medicalHistoryType,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        speciality,
        diseaseName,
        lastTimeDiagnosed,
        familyInfectionSpreadLevel,
        medicines,
        date,
        notes,
        patientId,
        medicalHistoryType,
        id,
        createdAt,
        isDeleted,
      ];
}
