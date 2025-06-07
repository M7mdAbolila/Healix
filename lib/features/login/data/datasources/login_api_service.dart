import 'package:healix/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseModel> login(@Body() LoginRequestModel body);
}
