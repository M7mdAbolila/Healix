import 'package:dartz/dartz.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../domain/repositories/chat_repo.dart';
import '../datasources/chat_api_service.dart';
import '../models/chat_request_body.dart';
import '../models/chat_response_model.dart';

class ChatRepoImpl implements ChatRepo {
  final ChatApiService _apiService;

  ChatRepoImpl(this._apiService);

  @override
  Future<Either<ApiErrorModel, ChatResponseModel>> sendMessage(
      ChatRequestBody requestBody) async {
    try {
      final response = await _apiService.sendMessage(requestBody);
      return right(response);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
