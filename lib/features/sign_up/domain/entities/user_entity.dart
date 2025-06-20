import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? fname;
  final String? lname;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;
  final String? userType;
  final String? dateOfBirth;
  final int? gender;
  final String? nationalId;
  final String? id;
  final String? createdAt;
  final bool? isDeleted;

  const UserEntity({
    this.fname,
    this.lname,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.userType,
    this.dateOfBirth,
    this.gender,
    this.nationalId,
    this.id,
    this.createdAt,
    this.isDeleted,
  });

  @override
  List<Object?> get props => [
        fname,
        lname,
        email,
        photoUrl,
        phoneNumber,
        userType,
        dateOfBirth,
        gender,
        nationalId,
        id,
        createdAt,
        isDeleted,
      ];
}
