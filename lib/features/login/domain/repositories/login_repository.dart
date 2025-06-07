import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import 'package:healix/features/login/domain/entities/login_request_entity.dart';

import '../../data/models/login_response_model.dart';

abstract class LoginRepository {
  Future<Either<ApiErrorModel, LoginResponseModel>> login(
      LoginRequestEntity request);
}
