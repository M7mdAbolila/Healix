import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../../../core/domain/entities/auth_response_entity.dart';
import '../entities/login_request_entity.dart';

abstract class LoginRepository {
  Future<Either<ApiErrorModel, AuthResponseEntity>> login(
      LoginRequestEntity request);
}