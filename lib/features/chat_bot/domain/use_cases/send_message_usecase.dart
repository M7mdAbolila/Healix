import 'package:dartz/dartz.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../data/models/chat_request_body.dart';
import '../../data/models/chat_response_model.dart';
import '../repositories/chat_repo.dart';

class SendMessageUseCase {
  final ChatRepo _chatRepo;

  SendMessageUseCase(this._chatRepo);

  Future<Either<ApiErrorModel, ChatResponseModel>> call(
      ChatRequestBody requestBody) async {
    return await _chatRepo.sendMessage(requestBody);
  }
}
