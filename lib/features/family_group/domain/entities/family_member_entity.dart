import 'package:equatable/equatable.dart';

class FamilyMemberEntity extends Equatable {
  final String? fname;
  final String? lname;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;

  const FamilyMemberEntity({
    this.fname,
    this.lname,
    this.email,
    this.photoUrl,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        fname,
        lname,
        email,
        photoUrl,
        phoneNumber,
      ];
}
