import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../data/models/sign_up/sign_up_request_model.dart';
import '../../data/models/sign_up/sign_up_response_model.dart';
import '../repositories/sign_up_repository.dart';

class SignUpUseCase {
  final SignUpRepository repository;
  SignUpUseCase(this.repository);

  Future<Either<ApiErrorModel, SignUpResponseModel>> call(
      SignUpRequestModel request) {
    return repository.signUp(request);
  }
}
