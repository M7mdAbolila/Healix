import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/chat_request_body.dart';
import '../models/chat_response_model.dart';

part 'chat_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.chatBaseUrl)
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String baseUrl}) = _ChatApiService;

  @POST(ApiConstants.chatEndpoint)
  Future<ChatResponseModel> sendMessage(@Body() ChatRequestBody body);
}
