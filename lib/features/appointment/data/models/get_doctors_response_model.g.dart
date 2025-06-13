// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctors_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      lat: json['lat'] as num?,
      long: json['long'] as num?,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      status: json['status'] as num?,
      day: json['day'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'day': instance.day,
      'from': instance.from,
      'to': instance.to,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

DoctorCertificateModel _$DoctorCertificateModelFromJson(
        Map<String, dynamic> json) =>
    DoctorCertificateModel(
      certificateUrl: json['certificateUrl'] as String?,
      doctorId: json['doctorId'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$DoctorCertificateModelToJson(
        DoctorCertificateModel instance) =>
    <String, dynamic>{
      'certificateUrl': instance.certificateUrl,
      'doctorId': instance.doctorId,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

ClinicModel _$ClinicModelFromJson(Map<String, dynamic> json) => ClinicModel(
      name: json['name'] as String?,
      hotline: json['hotline'] as String?,
      city: json['city'] as String?,
      photoUrl: json['photoUrl'] as String?,
      fees: (json['fees'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$ClinicModelToJson(ClinicModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hotline': instance.hotline,
      'city': instance.city,
      'photoUrl': instance.photoUrl,
      'fees': instance.fees,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      yearsOfExperience: json['yearsOfExperience'] as num?,
      professionalTitle: json['professionalTitle'] as String?,
      doctorSpeciality: (json['doctorSpeciality'] as num?)?.toInt(),
      userType: json['userType'] as String?,
      bloodType: (json['bloodType'] as num?)?.toInt(),
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      nationalId: json['nationalId'] as String?,
      checkedInAppointmentsCount:
          (json['checkedInAppointmentsCount'] as num?)?.toInt(),
      completedAppointmentsCount:
          (json['completedAppointmentsCount'] as num?)?.toInt(),
      cancelledAppointmentsCount:
          (json['cancelledAppointmentsCount'] as num?)?.toInt(),
      pendingAppointmentsCount:
          (json['pendingAppointmentsCount'] as num?)?.toInt(),
      doctorCertificates: (json['doctorCertificates'] as List<dynamic>?)
          ?.map(
              (e) => DoctorCertificateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      clinic: json['clinic'] == null
          ? null
          : ClinicModel.fromJson(json['clinic'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'yearsOfExperience': instance.yearsOfExperience,
      'professionalTitle': instance.professionalTitle,
      'doctorSpeciality': instance.doctorSpeciality,
      'userType': instance.userType,
      'bloodType': instance.bloodType,
      'height': instance.height,
      'weight': instance.weight,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'nationalId': instance.nationalId,
      'checkedInAppointmentsCount': instance.checkedInAppointmentsCount,
      'completedAppointmentsCount': instance.completedAppointmentsCount,
      'cancelledAppointmentsCount': instance.cancelledAppointmentsCount,
      'pendingAppointmentsCount': instance.pendingAppointmentsCount,
      'id': instance.id,
      'doctorCertificates': instance.doctorCertificates,
      'clinic': instance.clinic,
    };

GetDoctorsResponseModel _$GetDoctorsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetDoctorsResponseModel(
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDoctorsResponseModelToJson(
        GetDoctorsResponseModel instance) =>
    <String, dynamic>{
      'doctors': instance.doctors,
    };
