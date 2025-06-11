import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_error_model.dart';
import '../entities/get_all_chats_response_entity.dart';
import '../repositories/chat_repo.dart';

class GetAllChatsUseCase {
  final ChatRepo _chatRepo;

  GetAllChatsUseCase(this._chatRepo);

  Future<Either<ApiErrorModel, GetAllChatsResponseEntity>> call() async {
    return await _chatRepo.getAllChats();
  }
}
