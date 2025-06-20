import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../../../core/domain/entities/auth_response_entity.dart';
import '../../domain/entities/login_request_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_api_service.dart';
import '../mappers/login_data_mapper.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiService _apiService;

  LoginRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiErrorModel, AuthResponseEntity>> login(
    LoginRequestEntity request,
  ) async {
    try {
      final requestModel = LoginDataMapper.toRequestModel(request);

      final response = await _apiService.login(requestModel);

      final authResponse = LoginDataMapper.toAuthResponseEntity(response);

      return right(authResponse);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
