import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_error_model.dart';
import '../entities/message.dart';
import '../repositories/chat_repo.dart';

class SendMessageUseCase {
  final ChatRepo _chatRepo;

  SendMessageUseCase(this._chatRepo);

  Future<Either<ApiErrorModel, Message>> call({
    required String message,
    String? chatId,
    List<MultipartFile>? files,
  }) async {
    return await _chatRepo.sendMessage(
      message: message,
      chatId: chatId,
      files: files,
    );
  }
}
