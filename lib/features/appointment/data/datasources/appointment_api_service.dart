import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/get_doctors_request_model.dart';
import '../models/get_doctors_response_model.dart';

part 'appointment_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppointmentApiService {
  factory AppointmentApiService(Dio dio, {String baseUrl}) =
      _AppointmentApiService;

  @GET(ApiConstants.getDoctorsEndpoint)
  Future<GetDoctorsResponseModel> getDoctors(
    @Body() GetDoctorsRequestModel request,
  );
}
