import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final String? token;
  final UserWrapper? user;

  SignUpResponseModel({this.token, this.user});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class UserWrapper {
  final String? userType;
  final UserModel? user;

  UserWrapper({this.userType, this.user});

  factory UserWrapper.fromJson(Map<String, dynamic> json) =>
      _$UserWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$UserWrapperToJson(this);
}

@JsonSerializable()
class UserModel {
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

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
