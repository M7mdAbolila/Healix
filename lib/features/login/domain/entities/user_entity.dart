import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? fname;
  final String? lname;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;
  final String? dateOfBirth;
  final int? gender;
  final String? nationalId;
  final String? id;

  const UserEntity({
    this.fname,
    this.lname,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.nationalId,
    this.id,
  });

  @override
  List<Object?> get props => [
        fname,
        lname,
        email,
        photoUrl,
        phoneNumber,
        dateOfBirth,
        gender,
        nationalId,
        id,
      ];
}
