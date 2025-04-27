part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final ChatResponseModel response;

  ChatSuccess(this.response);
}

class ChatFailure extends ChatState {
  final String error;

  ChatFailure(this.error);
}
