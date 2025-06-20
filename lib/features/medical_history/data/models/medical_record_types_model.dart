import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/medical_record_types_entity.dart';

part 'medical_record_types_model.g.dart';

// Medical Visit Record Model (Type 0)
@JsonSerializable()
class MedicalVisitRecordModel extends MedicalVisitRecordEntity {
  @override
  @JsonKey(name: 'isFirstTime')
  final bool? isFirstTime;

  @override
  @JsonKey(name: 'doctorName')
  final String? doctorName;

  @override
  @JsonKey(name: 'speciality')
  final String? speciality;

  @override
  @JsonKey(name: 'clinicName')
  final String? clinicName;

  @override
  @JsonKey(name: 'medicalDiagnoses')
  final String? medicalDiagnoses;

  @override
  @JsonKey(name: 'prescription')
  final String? prescription;

  @override
  @JsonKey(name: 'date')
  final String? date;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  @override
  @JsonKey(name: 'medicalHistoryType')
  final int? medicalHistoryType;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const MedicalVisitRecordModel({
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
  }) : super(
          isFirstTime: isFirstTime,
          doctorName: doctorName,
          speciality: speciality,
          clinicName: clinicName,
          medicalDiagnoses: medicalDiagnoses,
          prescription: prescription,
          date: date,
          notes: notes,
          patientId: patientId,
          medicalHistoryType: medicalHistoryType,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory MedicalVisitRecordModel.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisitRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisitRecordModelToJson(this);
}

// Lab Test Record Model (Type 1)
@JsonSerializable()
class LabTestRecordModel extends LabTestRecordEntity {
  @override
  @JsonKey(name: 'testName')
  final String? testName;

  @override
  @JsonKey(name: 'speciality')
  final String? speciality;

  @override
  @JsonKey(name: 'clinicName')
  final String? clinicName;

  @override
  @JsonKey(name: 'reports')
  final String? reports;

  @override
  @JsonKey(name: 'date')
  final String? date;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  @override
  @JsonKey(name: 'medicalHistoryType')
  final int? medicalHistoryType;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const LabTestRecordModel({
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
  }) : super(
          testName: testName,
          speciality: speciality,
          clinicName: clinicName,
          reports: reports,
          date: date,
          notes: notes,
          patientId: patientId,
          medicalHistoryType: medicalHistoryType,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory LabTestRecordModel.fromJson(Map<String, dynamic> json) =>
      _$LabTestRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$LabTestRecordModelToJson(this);
}

// X-Ray Record Model (Type 2)
@JsonSerializable()
class XRayRecordModel extends XRayRecordEntity {
  @override
  @JsonKey(name: 'scanType')
  final String? scanType;

  @override
  @JsonKey(name: 'scanName')
  final String? scanName;

  @override
  @JsonKey(name: 'facilityName')
  final String? facilityName;

  @override
  @JsonKey(name: 'scannedPart')
  final String? scannedPart;

  @override
  @JsonKey(name: 'reports')
  final String? reports;

  @override
  @JsonKey(name: 'date')
  final String? date;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  @override
  @JsonKey(name: 'medicalHistoryType')
  final int? medicalHistoryType;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const XRayRecordModel({
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
  }) : super(
          scanType: scanType,
          scanName: scanName,
          facilityName: facilityName,
          scannedPart: scannedPart,
          reports: reports,
          date: date,
          notes: notes,
          patientId: patientId,
          medicalHistoryType: medicalHistoryType,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory XRayRecordModel.fromJson(Map<String, dynamic> json) =>
      _$XRayRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$XRayRecordModelToJson(this);
}

// Surgery Record Model (Type 3)
@JsonSerializable()
class SurgeryRecordModel extends SurgeryRecordEntity {
  @override
  @JsonKey(name: 'speciality')
  final String? speciality;

  @override
  @JsonKey(name: 'procedureName')
  final String? procedureName;

  @override
  @JsonKey(name: 'doctorName')
  final String? doctorName;

  @override
  @JsonKey(name: 'clinicName')
  final String? clinicName;

  @override
  @JsonKey(name: 'reports')
  final String? reports;

  @override
  @JsonKey(name: 'date')
  final String? date;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  @override
  @JsonKey(name: 'medicalHistoryType')
  final int? medicalHistoryType;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const SurgeryRecordModel({
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
  }) : super(
          speciality: speciality,
          procedureName: procedureName,
          doctorName: doctorName,
          clinicName: clinicName,
          reports: reports,
          date: date,
          notes: notes,
          patientId: patientId,
          medicalHistoryType: medicalHistoryType,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory SurgeryRecordModel.fromJson(Map<String, dynamic> json) =>
      _$SurgeryRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurgeryRecordModelToJson(this);
}

// Allergy Record Model (Type 4)
@JsonSerializable()
class AllergyRecordModel extends AllergyRecordEntity {
  @override
  @JsonKey(name: 'allergen')
  final String? allergen;

  @override
  @JsonKey(name: 'reactionSeverity')
  final int? reactionSeverity;

  @override
  @JsonKey(name: 'allergyStatus')
  final int? allergyStatus;

  @override
  @JsonKey(name: 'date')
  final String? date;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  @override
  @JsonKey(name: 'medicalHistoryType')
  final int? medicalHistoryType;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const AllergyRecordModel({
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
  }) : super(
          allergen: allergen,
          reactionSeverity: reactionSeverity,
          allergyStatus: allergyStatus,
          date: date,
          notes: notes,
          patientId: patientId,
          medicalHistoryType: medicalHistoryType,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory AllergyRecordModel.fromJson(Map<String, dynamic> json) =>
      _$AllergyRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllergyRecordModelToJson(this);
}

// Log Record Model (Type 5)
@JsonSerializable()
class LogRecordModel extends LogRecordEntity {
  @override
  @JsonKey(name: 'logType')
  final String? logType;

  @override
  @JsonKey(name: 'speciality')
  final String? speciality;

  @override
  @JsonKey(name: 'reports')
  final String? reports;

  @override
  @JsonKey(name: 'date')
  final String? date;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  @override
  @JsonKey(name: 'medicalHistoryType')
  final int? medicalHistoryType;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const LogRecordModel({
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
  }) : super(
          logType: logType,
          speciality: speciality,
          reports: reports,
          date: date,
          notes: notes,
          patientId: patientId,
          medicalHistoryType: medicalHistoryType,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory LogRecordModel.fromJson(Map<String, dynamic> json) =>
      _$LogRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogRecordModelToJson(this);
}

// Chronic Disease Record Model (Type 6)
@JsonSerializable()
class ChronicDiseaseRecordModel extends ChronicDiseaseRecordEntity {
  @override
  @JsonKey(name: 'speciality')
  final String? speciality;

  @override
  @JsonKey(name: 'diseaseName')
  final String? diseaseName;

  @override
  @JsonKey(name: 'riskLevel')
  final int? riskLevel;

  @override
  @JsonKey(name: 'supervisedBy')
  final String? supervisedBy;

  @override
  @JsonKey(name: 'medicines')
  final String? medicines;

  @override
  @JsonKey(name: 'reports')
  final String? reports;

  @override
  @JsonKey(name: 'date')
  final String? date;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  @override
  @JsonKey(name: 'medicalHistoryType')
  final int? medicalHistoryType;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const ChronicDiseaseRecordModel({
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
  }) : super(
          speciality: speciality,
          diseaseName: diseaseName,
          riskLevel: riskLevel,
          supervisedBy: supervisedBy,
          medicines: medicines,
          reports: reports,
          date: date,
          notes: notes,
          patientId: patientId,
          medicalHistoryType: medicalHistoryType,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory ChronicDiseaseRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ChronicDiseaseRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChronicDiseaseRecordModelToJson(this);
}

// Hereditary Disease Record Model (Type 7)
@JsonSerializable()
class HereditaryDiseaseRecordModel extends HereditaryDiseaseRecordEntity {
  @override
  @JsonKey(name: 'speciality')
  final String? speciality;

  @override
  @JsonKey(name: 'diseaseName')
  final String? diseaseName;

  @override
  @JsonKey(name: 'lastTimeDiagnosed')
  final String? lastTimeDiagnosed;

  @override
  @JsonKey(name: 'familyInfectionSpreadLevel')
  final String? familyInfectionSpreadLevel;

  @override
  @JsonKey(name: 'medicines')
  final String? medicines;

  @override
  @JsonKey(name: 'date')
  final String? date;

  @override
  @JsonKey(name: 'notes')
  final String? notes;

  @override
  @JsonKey(name: 'patientId')
  final String? patientId;

  @override
  @JsonKey(name: 'medicalHistoryType')
  final int? medicalHistoryType;

  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;

  const HereditaryDiseaseRecordModel({
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
  }) : super(
          speciality: speciality,
          diseaseName: diseaseName,
          lastTimeDiagnosed: lastTimeDiagnosed,
          familyInfectionSpreadLevel: familyInfectionSpreadLevel,
          medicines: medicines,
          date: date,
          notes: notes,
          patientId: patientId,
          medicalHistoryType: medicalHistoryType,
          id: id,
          createdAt: createdAt,
          isDeleted: isDeleted,
        );

  factory HereditaryDiseaseRecordModel.fromJson(Map<String, dynamic> json) =>
      _$HereditaryDiseaseRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$HereditaryDiseaseRecordModelToJson(this);
}
