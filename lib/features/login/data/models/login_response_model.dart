import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String? token;
  final UserWrapper? user;

  LoginResponseModel({this.token, this.user});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
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
  final String? dateOfBirth;
  final int? gender;
  final String? nationalId;
  final String? id;

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}


