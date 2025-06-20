import 'package:equatable/equatable.dart';
import '../../../domain/entities/message_entity.dart';

abstract class ChatBotState extends Equatable {
  const ChatBotState();

  @override
  List<Object?> get props => [];
}

class ChatBotInitial extends ChatBotState {
  const ChatBotInitial();
}

class ChatBotLoading extends ChatBotState {
  const ChatBotLoading();
}

class ChatBotSuccess extends ChatBotState {
  final MessageEntity message;

  const ChatBotSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ChatBotFailure extends ChatBotState {
  final String errorMessage;

  const ChatBotFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ChatBotValidationError extends ChatBotState {
  final Map<String, String> fieldErrors;

  const ChatBotValidationError(this.fieldErrors);

  @override
  List<Object?> get props => [fieldErrors];
}

class ChatBotFilesSelected extends ChatBotState {
  final List<String> selectedFiles;

  const ChatBotFilesSelected(this.selectedFiles);

  @override
  List<Object?> get props => [selectedFiles];
}
