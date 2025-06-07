// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) =>
    SignUpResponseModel(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserWrapper.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseModelToJson(
        SignUpResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

UserWrapper _$UserWrapperFromJson(Map<String, dynamic> json) => UserWrapper(
      userType: json['userType'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserWrapperToJson(UserWrapper instance) =>
    <String, dynamic>{
      'userType': instance.userType,
      'user': instance.user,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      userType: json['userType'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      nationalId: json['nationalId'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'userType': instance.userType,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'nationalId': instance.nationalId,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
    };
