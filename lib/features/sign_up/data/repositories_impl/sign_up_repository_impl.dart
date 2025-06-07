import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import 'package:healix/features/sign_up/domain/entities/sign_up_request_entity.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_api_service.dart';
import '../models/sign_up/sign_up_request_model.dart';
import '../models/sign_up/sign_up_response_model.dart';
import '../models/verify_email/verify_email_request_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpApiService apiService;

  SignUpRepositoryImpl(this.apiService);

  @override
  Future<Either<ApiErrorModel, SignUpResponseModel>> signUp(
      SignUpRequestEntity request) async {
    final SignUpRequestModel requestModel = SignUpRequestModel(
      fullName: request.fullName,
      email: request.email,
      password: request.password,
      confirmPassword: request.confirmPassword,
      userType: request.userType,
      locationLat: request.locationLat,
      locationLong: request.locationLong,
      profilePhoto: request.profilePhoto,
      phoneNumber: request.phoneNumber,
      nationalId: request.nationalId,
      dateOfBirth: request.dateOfBirth,
      bloodType: request.bloodType,
      height: request.height,
      weight: request.weight,
      gender: request.gender,
    );

    try {
      final formData = await requestModel.toFormData();
      final response = await apiService.signUp(formData);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, dynamic>> verifyEmail(String email) async {
    try {
      final response = await apiService.verifyEmail(
        VerifyEmailRequestModel(email: email),
      );
      return right(response);
    } catch (e) {
      return left(
        ApiErrorHandler.handle(e),
      );
    }
  }
}
