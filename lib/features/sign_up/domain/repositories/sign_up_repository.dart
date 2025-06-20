import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../../../core/domain/entities/auth_response_entity.dart';
import '../entities/sign_up_request_entity.dart';

abstract class SignUpRepository {
  Future<Either<ApiErrorModel, AuthResponseEntity>> signUp(
      SignUpRequestEntity request);
  Future<Either<ApiErrorModel, dynamic>> verifyEmail(String email);
}
