import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_error_model.dart';
import '../entities/message_entity.dart';
import '../entities/send_message_request_entity.dart';
import '../repositories/chat_bot_repository.dart';

class SendMessageUseCase {
  final ChatBotRepository _repository;

  SendMessageUseCase(this._repository);

  Future<Either<ApiErrorModel, MessageEntity>> call(
    SendMessageRequestEntity request,
  ) async {
    return await _repository.sendMessage(request);
  }
}
