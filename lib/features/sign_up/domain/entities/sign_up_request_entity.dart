import 'package:equatable/equatable.dart';
import 'dart:io';

class SignUpRequestEntity extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String userType;
  final String locationLat;
  final String locationLong;
  final File? profilePhoto;
  final String phoneNumber;
  final String nationalId;
  final String dateOfBirth;
  final int bloodType;
  final String height;
  final String weight;
  final int gender;

  const SignUpRequestEntity({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.userType,
    required this.locationLat,
    required this.locationLong,
    this.profilePhoto,
    required this.phoneNumber,
    required this.nationalId,
    required this.dateOfBirth,
    required this.bloodType,
    required this.height,
    required this.weight,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        password,
        confirmPassword,
        userType,
        locationLat,
        locationLong,
        profilePhoto,
        phoneNumber,
        nationalId,
        dateOfBirth,
        bloodType,
        height,
        weight,
        gender,
      ];
}
