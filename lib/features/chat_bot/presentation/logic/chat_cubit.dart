import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_request_body.dart';
import '../../data/models/chat_response_model.dart';
import '../../domain/use_cases/send_message_usecase.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase _sendMessageUseCase;

  ChatCubit(this._sendMessageUseCase) : super(ChatInitial());

  Future<void> sendMessage(ChatRequestBody requestBody) async {
    emit(ChatLoading());
    final result = await _sendMessageUseCase(requestBody);

    result.fold(
      (error) => emit(ChatFailure(error.errMessage)),
      (response) => emit(ChatSuccess(response)),
    );
  }
}
