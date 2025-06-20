import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../../../core/domain/entities/auth_response_entity.dart';
import '../../domain/entities/sign_up_request_entity.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_api_service.dart';
import '../mappers/sign_up_data_mapper.dart';
import '../models/verify_email/verify_email_request_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpApiService _apiService;

  SignUpRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiErrorModel, AuthResponseEntity>> signUp(
    SignUpRequestEntity request,
  ) async {
    try {
      final requestModel = SignUpDataMapper.toRequestModel(request);

      final formData = await requestModel.toFormData();

      final response = await _apiService.signUp(formData);

      final authResponse = SignUpDataMapper.toAuthResponseEntity(response);

      return right(authResponse);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, dynamic>> verifyEmail(String email) async {
    try {
      final response = await _apiService.verifyEmail(
        VerifyEmailRequestModel(email: email),
      );
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
