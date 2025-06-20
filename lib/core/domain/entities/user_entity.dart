import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? photoUrl;
  final String? phoneNumber;
  final String? dateOfBirth;
  final int? gender;
  final String? nationalId;
  final String? userType;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.photoUrl,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.nationalId,
    this.userType,
  });

  String get fullName => '$firstName $lastName';

  bool get hasProfilePhoto => photoUrl != null && photoUrl!.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        photoUrl,
        phoneNumber,
        dateOfBirth,
        gender,
        nationalId,
        userType,
      ];
}
