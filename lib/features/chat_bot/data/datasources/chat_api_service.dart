import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/requests/send_message_request.dart';
import '../models/responses/send_message_response.dart';

part 'chat_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.chatBaseUrl)
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String? baseUrl}) = _ChatApiService;

  @POST(ApiConstants.chatEndpoint)
  Future<SendMessageResponse> sendMessage(
    @Body() SendMessageRequest request,
    @Query("key") String apiKey,
  );
}
