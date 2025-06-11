import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/responses/send_message_response_model.dart';
import '../models/responses/get_all_chats_response_model.dart';

part 'chatbot_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ChatbotApiService {
  factory ChatbotApiService(Dio dio, {String? baseUrl}) = _ChatbotApiService;

  @POST(ApiConstants.sendMessageEndpoint)
  Future<SendMessageResponseModel> sendMessage(
    @Body() FormData formData,
  );

  @GET(ApiConstants.getAllChatsEndpoint)
  Future<GetAllChatsResponseModel> getAllChats();
}
