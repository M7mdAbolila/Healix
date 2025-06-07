import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_model.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;
  LoginUseCase(this.repository);

  Future<Either<ApiErrorModel, LoginResponseModel>> call(
      LoginRequestModel request) {
    return repository.login(request);
  }
}
