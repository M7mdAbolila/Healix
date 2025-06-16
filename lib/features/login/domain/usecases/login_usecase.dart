import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../../../core/domain/entities/auth_response_entity.dart';
import '../entities/login_request_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<ApiErrorModel, AuthResponseEntity>> call(
    LoginRequestEntity request,
  ) async {
    return await _repository.login(request);
  }
}
