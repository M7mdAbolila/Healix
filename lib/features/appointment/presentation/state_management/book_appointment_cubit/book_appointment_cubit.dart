import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/services/input_validation_service.dart';
import '../../../../../core/helpers/logging.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/book_appointment_usecase.dart';
import '../../form_managers/appointment_form_managers.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final BookAppointmentUseCase _bookAppointmentUseCase;
  final InputValidationService _validationService;
  final BookAppointmentFormManager _formManager;

  BookAppointmentCubit({
    required BookAppointmentUseCase bookAppointmentUseCase,
    required InputValidationService validationService,
    required BookAppointmentFormManager formManager,
  })  : _bookAppointmentUseCase = bookAppointmentUseCase,
        _validationService = validationService,
        _formManager = formManager,
        super(const BookAppointmentInitial());

  BookAppointmentFormManager get formManager => _formManager;

  String? validateDay(String? day) =>
      _validationService.validateRequiredField(day, 'Appointment day');

  String? validateTime(String? time) =>
      _validationService.validateRequiredField(time, 'Appointment time');

  String? validateDoctorId(String? doctorId) =>
      _validationService.validateRequiredField(doctorId, 'Doctor');

  Future<void> bookAppointment({
    required String day,
    required String from,
    required String to,
    required String doctorId,
  }) async {
    final validationErrors = _validateBookingInputs(day, from, to, doctorId);
    if (validationErrors.isNotEmpty) {
      emit(BookAppointmentValidationError(validationErrors));
      return;
    }

    emit(const BookAppointmentLoading());

    try {
      final request = BookAppointmentRequestEntity(
        day: day,
        from: from,
        to: to,
        doctorId: doctorId,
      );

      final result = await _bookAppointmentUseCase.call(request);

      result.fold(
        (failure) {
          Logging.error('Book appointment failed: ${failure.errMessage}');
          emit(BookAppointmentError(failure.errMessage));
        },
        (response) {
          Logging.info('Book appointment success: ${response.appointment?.id}');
          emit(BookAppointmentSuccess(response));
          _formManager.clearForm();
        },
      );
    } catch (e) {
      Logging.error('Unexpected error in bookAppointment: $e');
      emit(const BookAppointmentError(
          'An unexpected error occurred. Please try again.'));
    }
  }

  Map<String, String> _validateBookingInputs(
    String day,
    String from,
    String to,
    String doctorId,
  ) {
    final errors = <String, String>{};

    final dayError = validateDay(day);
    if (dayError != null) {
      errors['day'] = dayError;
    }

    final fromError = validateTime(from);
    if (fromError != null) {
      errors['from'] = fromError;
    }

    final toError = validateTime(to);
    if (toError != null) {
      errors['to'] = toError;
    }

    final doctorError = validateDoctorId(doctorId);
    if (doctorError != null) {
      errors['doctorId'] = doctorError;
    }

    if (fromError == null && toError == null) {
      try {
        final fromTime = DateTime.parse('2024-01-01 $from');
        final toTime = DateTime.parse('2024-01-01 $to');
        if (fromTime.isAfter(toTime) || fromTime.isAtSameMomentAs(toTime)) {
          errors['time'] = 'Start time must be before end time';
        }
      } catch (e) {
        errors['time'] = 'Invalid time format';
      }
    }

    return errors;
  }

  void resetState() {
    emit(const BookAppointmentInitial());
  }

  void clearForm() {
    _formManager.clearForm();
    resetState();
  }

  @override
  Future<void> close() {
    _formManager.dispose();
    return super.close();
  }
}
