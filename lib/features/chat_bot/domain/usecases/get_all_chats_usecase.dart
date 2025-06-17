import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_error_model.dart';
import '../entities/get_all_chats_response_entity.dart';
import '../repositories/chat_bot_repository.dart';

class GetAllChatsUseCase {
  final ChatBotRepository _repository;

  GetAllChatsUseCase(this._repository);

  Future<Either<ApiErrorModel, GetAllChatsResponseEntity>> call() async {
    return await _repository.getAllChats();
  }
}
