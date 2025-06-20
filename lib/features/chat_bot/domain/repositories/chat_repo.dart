import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/networking/api_error_model.dart';
import '../entities/message.dart';
import '../entities/get_all_chats_response_entity.dart';

abstract class ChatRepo {
  Future<Either<ApiErrorModel, Message>> sendMessage({
    required String message,
    String? chatId,
    List<MultipartFile>? files,
  });

  Future<Either<ApiErrorModel, GetAllChatsResponseEntity>> getAllChats();
}
