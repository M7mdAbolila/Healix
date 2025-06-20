import '../../../../core/domain/entities/auth_response_entity.dart';
import '../../../../core/domain/entities/user_entity.dart';
import '../models/sign_up/sign_up_response_model.dart';
import '../../domain/entities/sign_up_request_entity.dart';
import '../models/sign_up/sign_up_request_model.dart';

class SignUpDataMapper {
  static SignUpRequestModel toRequestModel(SignUpRequestEntity entity) {
    return SignUpRequestModel(
      fullName: entity.fullName,
      email: entity.email,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
      userType: entity.userType,
      locationLat: entity.locationLat,
      locationLong: entity.locationLong,
      profilePhoto: entity.profilePhoto,
      phoneNumber: entity.phoneNumber,
      nationalId: entity.nationalId,
      dateOfBirth: entity.dateOfBirth,
      bloodType: entity.bloodType,
      height: entity.height,
      weight: entity.weight,
      gender: entity.gender,
    );
  }

  static AuthResponseEntity toAuthResponseEntity(SignUpResponseModel model) {
    return AuthResponseEntity(
      token: model.token ?? '',
      user: _mapToUserEntity(model.user?.user),
      userType: model.user?.userType,
    );
  }

  static UserEntity _mapToUserEntity(UserModel? userModel) {
    if (userModel == null) {
      throw Exception('User data is missing from response');
    }

    return UserEntity(
      id: userModel.id ?? '',
      firstName: userModel.fname ?? '',
      lastName: userModel.lname ?? '',
      email: userModel.email ?? '',
      photoUrl: userModel.photoUrl,
      phoneNumber: userModel.phoneNumber,
      dateOfBirth: userModel.dateOfBirth,
      gender: userModel.gender,
      nationalId: userModel.nationalId,
      userType: userModel.userType,
    );
  }
}
