class LocationEntity {
  final num? lat;
  final num? long;

  const LocationEntity({
    this.lat,
    this.long,
  });
}

class AppointmentEntity {
  final num? status;
  final String? day;
  final String? from;
  final String? to;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const AppointmentEntity({
    this.status,
    this.day,
    this.from,
    this.to,
    this.id,
    this.createdAt,
    this.isDeleted,
  });
}

class DoctorCertificateEntity {
  final String? certificateUrl;
  final String? doctorId;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const DoctorCertificateEntity({
    this.certificateUrl,
    this.doctorId,
    this.id,
    this.createdAt,
    this.isDeleted,
  });
}

class ClinicEntity {
  final String? name;
  final String? hotline;
  final String? city;
  final String? photoUrl;
  final int? fees;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const ClinicEntity({
    this.name,
    this.hotline,
    this.city,
    this.photoUrl,
    this.fees,
    this.id,
    this.createdAt,
    this.isDeleted,
  });
}

class DoctorEntity {
  final String? fname;
  final String? lname;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;
  final num? yearsOfExperience;
  final String? professionalTitle;
  final int? doctorSpeciality;
  final String? userType;
  final int? bloodType;
  final String? height;
  final String? weight;
  final String? dateOfBirth;
  final int? gender;
  final String? nationalId;
  final int? checkedInAppointmentsCount;
  final int? completedAppointmentsCount;
  final int? cancelledAppointmentsCount;
  final int? pendingAppointmentsCount;
  final List<DoctorCertificateEntity>? doctorCertificates;
  final ClinicEntity? clinic;
  final String? id;
  const DoctorEntity({
    this.fname,
    this.lname,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.yearsOfExperience,
    this.professionalTitle,
    this.doctorSpeciality,
    this.userType,
    this.bloodType,
    this.height,
    this.weight,
    this.dateOfBirth,
    this.gender,
    this.nationalId,
    this.checkedInAppointmentsCount,
    this.completedAppointmentsCount,
    this.cancelledAppointmentsCount,
    this.pendingAppointmentsCount,
    this.doctorCertificates,
    this.clinic,
    this.id,
  });
}

class GetDoctorsResponseEntity {
  final List<DoctorEntity>? doctors;

  const GetDoctorsResponseEntity({
    this.doctors,
  });
}
