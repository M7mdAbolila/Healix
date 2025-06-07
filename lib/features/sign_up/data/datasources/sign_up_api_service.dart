import 'package:healix/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/sign_up/sign_up_response_model.dart';
import '../models/verify_email/verify_email_request_model.dart';

part 'sign_up_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio, {String baseUrl}) = _SignUpApiService;

  @POST(ApiConstants.signUpEndpoint)
  Future<SignUpResponseModel> signUp(
    @Body() FormData formData,
  );

  @POST(ApiConstants.verifyEmailEndpoint)
  Future<dynamic> verifyEmail(
    @Body() VerifyEmailRequestModel requestModel,
  );
}
