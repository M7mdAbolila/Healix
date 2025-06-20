import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../../../core/domain/entities/auth_response_entity.dart';
import '../entities/sign_up_request_entity.dart';
import '../repositories/sign_up_repository.dart';

class SignUpUseCase {
  final SignUpRepository _repository;

  SignUpUseCase(this._repository);

  Future<Either<ApiErrorModel, AuthResponseEntity>> call(
    SignUpRequestEntity request,
  ) async {
    return await _repository.signUp(request);
  }
}
