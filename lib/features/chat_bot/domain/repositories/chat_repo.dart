
import 'package:dartz/dartz.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../data/models/chat_request_body.dart';
import '../../data/models/chat_response_model.dart';

abstract class ChatRepo {
  Future<Either<ApiErrorModel, ChatResponseModel>> sendMessage(
      ChatRequestBody requestBody);
}
