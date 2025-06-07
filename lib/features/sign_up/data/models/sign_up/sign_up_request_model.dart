import 'package:dio/dio.dart';
import 'package:healix/features/sign_up/domain/entities/sign_up_request_entity.dart';

class SignUpRequestModel extends SignUpRequestEntity {
  const SignUpRequestModel({
    required super.fullName,
    required super.email,
    required super.password,
    required super.confirmPassword,
    required super.userType,
    required super.locationLat,
    required super.locationLong,
    super.profilePhoto,
    required super.phoneNumber,
    required super.nationalId,
    required super.dateOfBirth,
    required super.bloodType,
    required super.height,
    required super.weight,
    required super.gender,
  });

  Future<FormData> toFormData() async {
    final formData = FormData.fromMap({
      'FullName': fullName,
      'Email': email,
      'Password': password,
      'ConfirmPassword': confirmPassword,
      'UserType': userType,
      'Location.Lat': locationLat,
      'Location.Long': locationLong,
      'PhoneNumber': phoneNumber,
      'NationalId': nationalId,
      'DateOfBirth': dateOfBirth,
      'BloodType': bloodType,
      'Height': height,
      'Weight': weight,
      'Gender': gender,
    });

    if (profilePhoto != null) {
      formData.files.add(
        MapEntry(
          'ProfilePhoto',
          await MultipartFile.fromFile(
            profilePhoto!.path,
            filename: profilePhoto!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}
