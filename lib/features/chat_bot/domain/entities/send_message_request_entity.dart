import 'package:equatable/equatable.dart';
import 'dart:io';

class SendMessageRequestEntity extends Equatable {
  final String message;
  final String? chatId;
  final List<File>? files;

  const SendMessageRequestEntity({
    required this.message,
    this.chatId,
    this.files,
  });

  @override
  List<Object?> get props => [message, chatId, files];
}
