import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/sign_up_request_entity.dart';
import '../../data/models/sign_up/sign_up_response_model.dart';

abstract class SignUpRepository {
  Future<Either<ApiErrorModel, SignUpResponseModel>> signUp(
      SignUpRequestEntity request);
  Future<Either<ApiErrorModel, dynamic>> verifyEmail(String email);
}
