import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import 'package:healix/features/login/domain/entities/login_request_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_api_service.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiService apiService;

  LoginRepositoryImpl(this.apiService);

  @override
  Future<Either<ApiErrorModel, LoginResponseModel>> login(
      LoginRequestEntity request) async {
    final LoginRequestModel requestModel = LoginRequestModel(
      email: request.email,
      password: request.password,
    );
    try {
      final response = await apiService.login(requestModel);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
