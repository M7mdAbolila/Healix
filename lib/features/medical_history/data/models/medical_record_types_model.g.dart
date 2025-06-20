// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisitRecordModel _$MedicalVisitRecordModelFromJson(
        Map<String, dynamic> json) =>
    MedicalVisitRecordModel(
      isFirstTime: json['isFirstTime'] as bool?,
      doctorName: json['doctorName'] as String?,
      speciality: json['speciality'] as String?,
      clinicName: json['clinicName'] as String?,
      medicalDiagnoses: json['medicalDiagnoses'] as String?,
      prescription: json['prescription'] as String?,
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      patientId: json['patientId'] as String?,
      medicalHistoryType: (json['medicalHistoryType'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$MedicalVisitRecordModelToJson(
        MedicalVisitRecordModel instance) =>
    <String, dynamic>{
      'isFirstTime': instance.isFirstTime,
      'doctorName': instance.doctorName,
      'speciality': instance.speciality,
      'clinicName': instance.clinicName,
      'medicalDiagnoses': instance.medicalDiagnoses,
      'prescription': instance.prescription,
      'date': instance.date,
      'notes': instance.notes,
      'patientId': instance.patientId,
      'medicalHistoryType': instance.medicalHistoryType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

LabTestRecordModel _$LabTestRecordModelFromJson(Map<String, dynamic> json) =>
    LabTestRecordModel(
      testName: json['testName'] as String?,
      speciality: json['speciality'] as String?,
      clinicName: json['clinicName'] as String?,
      reports: json['reports'] as String?,
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      patientId: json['patientId'] as String?,
      medicalHistoryType: (json['medicalHistoryType'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$LabTestRecordModelToJson(LabTestRecordModel instance) =>
    <String, dynamic>{
      'testName': instance.testName,
      'speciality': instance.speciality,
      'clinicName': instance.clinicName,
      'reports': instance.reports,
      'date': instance.date,
      'notes': instance.notes,
      'patientId': instance.patientId,
      'medicalHistoryType': instance.medicalHistoryType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

XRayRecordModel _$XRayRecordModelFromJson(Map<String, dynamic> json) =>
    XRayRecordModel(
      scanType: json['scanType'] as String?,
      scanName: json['scanName'] as String?,
      facilityName: json['facilityName'] as String?,
      scannedPart: json['scannedPart'] as String?,
      reports: json['reports'] as String?,
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      patientId: json['patientId'] as String?,
      medicalHistoryType: (json['medicalHistoryType'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$XRayRecordModelToJson(XRayRecordModel instance) =>
    <String, dynamic>{
      'scanType': instance.scanType,
      'scanName': instance.scanName,
      'facilityName': instance.facilityName,
      'scannedPart': instance.scannedPart,
      'reports': instance.reports,
      'date': instance.date,
      'notes': instance.notes,
      'patientId': instance.patientId,
      'medicalHistoryType': instance.medicalHistoryType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

SurgeryRecordModel _$SurgeryRecordModelFromJson(Map<String, dynamic> json) =>
    SurgeryRecordModel(
      speciality: json['speciality'] as String?,
      procedureName: json['procedureName'] as String?,
      doctorName: json['doctorName'] as String?,
      clinicName: json['clinicName'] as String?,
      reports: json['reports'] as String?,
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      patientId: json['patientId'] as String?,
      medicalHistoryType: (json['medicalHistoryType'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$SurgeryRecordModelToJson(SurgeryRecordModel instance) =>
    <String, dynamic>{
      'speciality': instance.speciality,
      'procedureName': instance.procedureName,
      'doctorName': instance.doctorName,
      'clinicName': instance.clinicName,
      'reports': instance.reports,
      'date': instance.date,
      'notes': instance.notes,
      'patientId': instance.patientId,
      'medicalHistoryType': instance.medicalHistoryType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

AllergyRecordModel _$AllergyRecordModelFromJson(Map<String, dynamic> json) =>
    AllergyRecordModel(
      allergen: json['allergen'] as String?,
      reactionSeverity: (json['reactionSeverity'] as num?)?.toInt(),
      allergyStatus: (json['allergyStatus'] as num?)?.toInt(),
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      patientId: json['patientId'] as String?,
      medicalHistoryType: (json['medicalHistoryType'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$AllergyRecordModelToJson(AllergyRecordModel instance) =>
    <String, dynamic>{
      'allergen': instance.allergen,
      'reactionSeverity': instance.reactionSeverity,
      'allergyStatus': instance.allergyStatus,
      'date': instance.date,
      'notes': instance.notes,
      'patientId': instance.patientId,
      'medicalHistoryType': instance.medicalHistoryType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

LogRecordModel _$LogRecordModelFromJson(Map<String, dynamic> json) =>
    LogRecordModel(
      logType: json['logType'] as String?,
      speciality: json['speciality'] as String?,
      reports: json['reports'] as String?,
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      patientId: json['patientId'] as String?,
      medicalHistoryType: (json['medicalHistoryType'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$LogRecordModelToJson(LogRecordModel instance) =>
    <String, dynamic>{
      'logType': instance.logType,
      'speciality': instance.speciality,
      'reports': instance.reports,
      'date': instance.date,
      'notes': instance.notes,
      'patientId': instance.patientId,
      'medicalHistoryType': instance.medicalHistoryType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

ChronicDiseaseRecordModel _$ChronicDiseaseRecordModelFromJson(
        Map<String, dynamic> json) =>
    ChronicDiseaseRecordModel(
      speciality: json['speciality'] as String?,
      diseaseName: json['diseaseName'] as String?,
      riskLevel: (json['riskLevel'] as num?)?.toInt(),
      supervisedBy: json['supervisedBy'] as String?,
      medicines: json['medicines'] as String?,
      reports: json['reports'] as String?,
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      patientId: json['patientId'] as String?,
      medicalHistoryType: (json['medicalHistoryType'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$ChronicDiseaseRecordModelToJson(
        ChronicDiseaseRecordModel instance) =>
    <String, dynamic>{
      'speciality': instance.speciality,
      'diseaseName': instance.diseaseName,
      'riskLevel': instance.riskLevel,
      'supervisedBy': instance.supervisedBy,
      'medicines': instance.medicines,
      'reports': instance.reports,
      'date': instance.date,
      'notes': instance.notes,
      'patientId': instance.patientId,
      'medicalHistoryType': instance.medicalHistoryType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

HereditaryDiseaseRecordModel _$HereditaryDiseaseRecordModelFromJson(
        Map<String, dynamic> json) =>
    HereditaryDiseaseRecordModel(
      speciality: json['speciality'] as String?,
      diseaseName: json['diseaseName'] as String?,
      lastTimeDiagnosed: json['lastTimeDiagnosed'] as String?,
      familyInfectionSpreadLevel: json['familyInfectionSpreadLevel'] as String?,
      medicines: json['medicines'] as String?,
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      patientId: json['patientId'] as String?,
      medicalHistoryType: (json['medicalHistoryType'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$HereditaryDiseaseRecordModelToJson(
        HereditaryDiseaseRecordModel instance) =>
    <String, dynamic>{
      'speciality': instance.speciality,
      'diseaseName': instance.diseaseName,
      'lastTimeDiagnosed': instance.lastTimeDiagnosed,
      'familyInfectionSpreadLevel': instance.familyInfectionSpreadLevel,
      'medicines': instance.medicines,
      'date': instance.date,
      'notes': instance.notes,
      'patientId': instance.patientId,
      'medicalHistoryType': instance.medicalHistoryType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };
