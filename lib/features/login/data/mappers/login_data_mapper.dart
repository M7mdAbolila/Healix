import '../../../../core/domain/entities/auth_response_entity.dart';
import '../../../../core/domain/entities/user_entity.dart';
import '../models/login_response_model.dart';
import '../../domain/entities/login_request_entity.dart';
import '../models/login_request_model.dart';

class LoginDataMapper {
  static LoginRequestModel toRequestModel(LoginRequestEntity entity) {
    return LoginRequestModel(
      email: entity.email,
      password: entity.password,
    );
  }

  static AuthResponseEntity toAuthResponseEntity(LoginResponseModel model) {
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
    );
  }
}
