import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_error_model.dart';
import '../entities/message.dart';

abstract class ChatRepo {
  Future<Either<ApiErrorModel, Message>> sendMessage({
    required String userInput,
    required List<Message> conversationHistory,
    List<String>? images,
  });
}
