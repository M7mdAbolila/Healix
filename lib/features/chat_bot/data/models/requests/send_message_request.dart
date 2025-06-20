import 'package:dio/dio.dart';

class SendMessageRequest {
  final String message;
  final String? chatId;
  final List<MultipartFile>? files;

  SendMessageRequest({
    required this.message,
    this.chatId,
    this.files,
  });

  FormData toFormData() {
    final formData = FormData();

    formData.fields.add(MapEntry('Message', message));

    if (chatId != null) {
      formData.fields.add(MapEntry('ChatId', chatId!));
    }

    if (files != null && files!.isNotEmpty) {
      for (var file in files!) {
        formData.files.add(MapEntry('Files', file));
      }
    }

    return formData;
  }
}
