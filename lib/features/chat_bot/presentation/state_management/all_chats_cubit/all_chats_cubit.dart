import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/logging.dart';
import '../../../domain/usecases/usecases.dart';
import 'all_chats_state.dart';

class AllChatsCubit extends Cubit<AllChatsState> {
  final GetAllChatsUseCase _getAllChatsUseCase;

  AllChatsCubit(this._getAllChatsUseCase) : super(const AllChatsInitial());

  Future<void> getAllChats() async {
    Logging.info('Fetching all chats');
    emit(const AllChatsLoading());

    try {
      final result = await _getAllChatsUseCase.call();

      result.fold(
        (error) {
          Logging.error('Error fetching all chats: ${error.errMessage}');
          emit(AllChatsError(error.errMessage));
        },
        (chatsResponse) {
          Logging.info(
              'All chats fetched successfully: ${chatsResponse.chats.length} chats');
          emit(AllChatsSuccess(chatsResponse));
        },
      );
    } catch (e) {
      emit(const AllChatsError(
          'An unexpected error occurred. Please try again.'));
    }
  }

  void refreshChats() {
    getAllChats();
  }
}
