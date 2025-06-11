import 'package:equatable/equatable.dart';
import 'package:healix/features/chat_bot/domain/entities/get_all_chats_response_entity.dart';

abstract class AllChatsState extends Equatable {
  const AllChatsState();

  @override
  List<Object?> get props => [];
}

class AllChatsInitial extends AllChatsState {
  const AllChatsInitial();
}

class AllChatsLoading extends AllChatsState {
  const AllChatsLoading();
}

class AllChatsSuccess extends AllChatsState {
  final GetAllChatsResponseEntity chatsResponse;

  const AllChatsSuccess(this.chatsResponse);

  @override
  List<Object?> get props => [chatsResponse];
}

class AllChatsError extends AllChatsState {
  final String errMessage;

  const AllChatsError(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
