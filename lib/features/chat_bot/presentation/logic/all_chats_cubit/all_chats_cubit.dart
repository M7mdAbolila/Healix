import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/logging.dart';
import '../../../domain/usecases/get_all_chats_use_case.dart';
import 'all_chats_state.dart';

class AllChatsCubit extends Cubit<AllChatsState> {
  final GetAllChatsUseCase _getAllChatsUseCase;

  AllChatsCubit(this._getAllChatsUseCase) : super(const AllChatsInitial());

  Future<void> getAllChats() async {
    Logging.info('Fetching all chats');
    emit(const AllChatsLoading());

    final result = await _getAllChatsUseCase.call();

    result.fold(
      (failure) {
        Logging.error('Error fetching all chats: ${failure.errMessage}');
        emit(AllChatsError(failure.errMessage));
      },
      (chatsResponse) {
        Logging.info(
            'All chats fetched successfully: ${chatsResponse.chats.length} chats');
        emit(AllChatsSuccess(chatsResponse));
      },
    );
  }

  void refreshChats() {
    getAllChats();
  }
}
