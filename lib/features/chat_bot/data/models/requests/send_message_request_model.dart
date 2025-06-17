import 'package:dio/dio.dart';
import '../../../domain/entities/send_message_request_entity.dart';

class SendMessageRequestModel extends SendMessageRequestEntity {
  const SendMessageRequestModel({
    required super.message,
    super.chatId,
    super.files,
  });

  Future<FormData> toFormData() async {
    final formData = FormData.fromMap({
      'Message': message,
    });

    if (chatId != null) {
      formData.fields.add(MapEntry('ChatId', chatId!));
    }

    if (files != null && files!.isNotEmpty) {
      for (var file in files!) {
        formData.files.add(
          MapEntry(
            'Files',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }
    }

    return formData;
  }
}
