import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/get_doctors_response_entity.dart';

part 'get_doctors_response_model.g.dart';

@JsonSerializable()
class LocationModel extends LocationEntity {
  const LocationModel({
    super.lat,
    super.long,
  });
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    super.status,
    super.day,
    super.from,
    super.to,
    super.id,
    super.createdAt,
    super.isDeleted,
  });
  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}

@JsonSerializable()
class DoctorCertificateModel extends DoctorCertificateEntity {
  const DoctorCertificateModel({
    super.certificateUrl,
    super.doctorId,
    super.id,
    super.createdAt,
    super.isDeleted,
  });
  factory DoctorCertificateModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorCertificateModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorCertificateModelToJson(this);
}

@JsonSerializable()
class ClinicModel extends ClinicEntity {
  @override
  const ClinicModel({
    super.name,
    super.hotline,
    super.city,
    super.photoUrl,
    super.fees,
    super.id,
    super.createdAt,
    super.isDeleted,
  });
  factory ClinicModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicModelToJson(this);
}

@JsonSerializable()
class DoctorModel extends DoctorEntity {
  @override
  final List<DoctorCertificateModel>? doctorCertificates;
  @override
  final ClinicModel? clinic;

  const DoctorModel({
    super.fname,
    super.lname,
    super.email,
    super.photoUrl,
    super.phoneNumber,
    super.yearsOfExperience,
    super.professionalTitle,
    super.doctorSpeciality,
    super.userType,
    super.bloodType,
    super.height,
    super.weight,
    super.dateOfBirth,
    super.gender,
    super.nationalId,
    super.checkedInAppointmentsCount,
    super.completedAppointmentsCount,
    super.cancelledAppointmentsCount,
    super.pendingAppointmentsCount,
    this.doctorCertificates,
    this.clinic,
    super.id,
  }) : super(
          doctorCertificates: doctorCertificates,
          clinic: clinic,
        );
  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}

@JsonSerializable()
class GetDoctorsResponseModel extends GetDoctorsResponseEntity {
  @override
  final List<DoctorModel>? doctors;
  const GetDoctorsResponseModel({
    this.doctors,
  }) : super(
          doctors: doctors,
        );

  factory GetDoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetDoctorsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDoctorsResponseModelToJson(this);
}
