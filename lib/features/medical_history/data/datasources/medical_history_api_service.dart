import 'package:dio/dio.dart';
import 'package:healix/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import '../models/get_medical_records_response_model.dart';

part 'medical_history_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class MedicalHistoryApiService {
  factory MedicalHistoryApiService(Dio dio, {String baseUrl}) =
      _MedicalHistoryApiService;

  @POST(ApiConstants.addHistoryRecordEndpoint)
  Future<dynamic> addHistoryRecord(
    @Body() FormData formData,
  );

  @GET(ApiConstants.addHistoryRecordEndpoint)
  Future<GetMedicalRecordsResponseModel> getMedicalRecordsByType(
    @Query('RecordType') int recordType,
  );
}
