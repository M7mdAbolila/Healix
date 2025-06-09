part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {}

final class ChatFailure extends ChatState {}

final class ChatFilesSelected extends ChatState {
  final List<PlatformFile> selectedFiles;

  ChatFilesSelected(this.selectedFiles);
}

final class ChatMessage extends ChatState {
  final String message;
  final bool isError;

  ChatMessage(this.message, {this.isError = false});
}
