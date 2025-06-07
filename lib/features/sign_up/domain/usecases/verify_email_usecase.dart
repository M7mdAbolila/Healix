import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../repositories/sign_up_repository.dart';

class VerifyEmailUseCase {
  final SignUpRepository repository;
  VerifyEmailUseCase(this.repository);

  Future<Either<ApiErrorModel, dynamic>> call(String email) {
    return repository.verifyEmail(email);
  }
}
