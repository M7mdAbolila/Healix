import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/services/input_validation_service.dart';
import '../../../../../core/helpers/logging.dart';
import '../../../domain/entities/get_schedule_request_entity.dart';
import '../../../domain/usecases/get_schedule_usecase.dart';
import 'get_schedule_state.dart';

class GetScheduleCubit extends Cubit<GetScheduleState> {
  final GetScheduleUseCase _getScheduleUseCase;
  final InputValidationService _validationService;

  GetScheduleCubit({
    required GetScheduleUseCase getScheduleUseCase,
    required InputValidationService validationService,
  })  : _getScheduleUseCase = getScheduleUseCase,
        _validationService = validationService,
        super(const GetScheduleInitial());

  String? validateDoctorId(String? doctorId) =>
      _validationService.validateRequiredField(doctorId, 'Doctor ID');

  Future<void> getSchedule({String? doctorId}) async {
    final validationErrors = _validateGetScheduleInputs(doctorId);
    if (validationErrors.isNotEmpty) {
      emit(GetScheduleValidationError(validationErrors));
      return;
    }

    if (isClosed) return;
    emit(const GetScheduleLoading());

    try {
      final result = await _getScheduleUseCase.call(
        GetScheduleRequestEntity(
          doctorId: doctorId,
        ),
      );

      if (isClosed) return;

      result.fold(
        (error) {
          Logging.error('Get schedule failed: ${error.errMessage}');
          emit(GetScheduleFailure(error.errMessage));
        },
        (response) {
          final scheduleInfo = response.schedule?.toString() ?? 'none';
          Logging.info('Get schedule success: schedule $scheduleInfo');
          emit(GetScheduleSuccess(response));
        },
      );
    } catch (e) {
      if (!isClosed) {
        Logging.error('Unexpected error in getSchedule: $e');
        emit(const GetScheduleFailure(
            'An unexpected error occurred. Please try again.'));
      }
    }
  }

  Map<String, String> _validateGetScheduleInputs(String? doctorId) {
    final errors = <String, String>{};

    final doctorIdError = validateDoctorId(doctorId);
    if (doctorIdError != null) {
      errors['doctorId'] = doctorIdError;
    }

    return errors;
  }

  void resetState() {
    if (!isClosed) {
      emit(const GetScheduleInitial());
    }
  }
}
