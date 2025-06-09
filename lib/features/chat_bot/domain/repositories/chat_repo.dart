import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/networking/api_error_model.dart';
import '../entities/message.dart';

abstract class ChatRepo {
  Future<Either<ApiErrorModel, Message>> sendMessage({
    required String message,
    String? chatId,
    List<MultipartFile>? files,
  });
}
