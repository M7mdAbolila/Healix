import 'package:equatable/equatable.dart';
import 'dart:io';
import 'medicine_entity.dart';

class HistoryRecordEntity extends Equatable {
  final String? notes;
  final String? doctorName;
  final DateTime? date;
  final String? speciality;
  final String? clinicName;
  final int? medicalHistoryType;
  final bool? isFirstTime;
  final String? medicalDiagnoses;
  final String? scanType;
  final String? scanName;
  final String? facilityName;
  final String? scannedPart;
  final String? procedureName;
  final String? testName;
  final String? logType;
  final String? diseaseName;
  final String? supervisedBy;
  final int? riskLevel;
  final String? lastTimeDiagnosed;
  final String? familyInfectionSpreadLevel;
  final String? allergen;
  final int? allergyStatus;
  final int? reactionSeverity;
  final List<File>? files;
  final List<MedicineEntity>? medicines;

  const HistoryRecordEntity({
    this.notes,
    this.doctorName,
    this.date,
    this.speciality,
    this.clinicName,
    this.medicalHistoryType,
    this.isFirstTime,
    this.medicalDiagnoses,
    this.scanType,
    this.scanName,
    this.facilityName,
    this.scannedPart,
    this.procedureName,
    this.testName,
    this.logType,
    this.diseaseName,
    this.supervisedBy,
    this.riskLevel,
    this.lastTimeDiagnosed,
    this.familyInfectionSpreadLevel,
    this.allergen,
    this.allergyStatus,
    this.reactionSeverity,
    this.files,
    this.medicines,
  });

  @override
  List<Object?> get props => [
        notes,
        doctorName,
        date,
        speciality,
        clinicName,
        medicalHistoryType,
        isFirstTime,
        medicalDiagnoses,
        scanType,
        scanName,
        facilityName,
        scannedPart,
        procedureName,
        testName,
        logType,
        diseaseName,
        supervisedBy,
        riskLevel,
        lastTimeDiagnosed,
        familyInfectionSpreadLevel,
        allergen,
        allergyStatus,
        reactionSeverity,
        files,
        medicines,
      ];
}
