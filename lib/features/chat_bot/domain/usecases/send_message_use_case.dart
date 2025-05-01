import 'package:dartz/dartz.dart';

import '../../../../core/networking/api_error_model.dart';
import '../entities/message.dart';
import '../repositories/chat_repo.dart';

class SendMessageUseCase {
  final ChatRepo _chatRepo;

  SendMessageUseCase(this._chatRepo);

  Future<Either<ApiErrorModel, Message>> call({
    required String userInput,
    required List<Message> conversationHistory,
    List<String>? images,
  }) async {
    return await _chatRepo.sendMessage(
      userInput: userInput,
      conversationHistory: conversationHistory,
      images: images,
    );
  }
}
