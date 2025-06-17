import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

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
  final String errorMessage;

  const AllChatsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
