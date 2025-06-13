import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/get_schedule_request_entity.dart';
import '../../../domain/entities/get_schedule_response_entity.dart';
import '../../../domain/usecases/get_schedule_usecase.dart';

part 'get_schedule_state.dart';

class GetScheduleCubit extends Cubit<GetScheduleState> {
  final GetScheduleUseCase getScheduleUseCase;
  GetScheduleCubit(this.getScheduleUseCase) : super(const GetScheduleInitial());

  void resetState() {
    if (!isClosed) {
      emit(const GetScheduleInitial());
    }
  }

  Future<void> getSchedule({String? doctorId}) async {
    if (isClosed) return;
    emit(const GetScheduleLoading());
    final result = await getScheduleUseCase.call(
      GetScheduleRequestEntity(
        doctorId: doctorId,
      ),
    );

    if (isClosed) return;

    result.fold(
      (error) => emit(
        GetScheduleFailure(error.errMessage),
      ),
      (response) => emit(
        GetScheduleSuccess(response),
      ),
    );
  }
}
