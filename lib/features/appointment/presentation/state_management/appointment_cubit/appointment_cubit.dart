import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/services/input_validation_service.dart';
import '../../../../../core/helpers/logging.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_doctors_usecase.dart';
import '../../form_managers/appointment_form_managers.dart';
import 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final GetDoctorsUseCase _getDoctorsUseCase;
  final InputValidationService _validationService;
  final DoctorSearchFormManager _formManager;

  AppointmentCubit({
    required GetDoctorsUseCase getDoctorsUseCase,
    required InputValidationService validationService,
    required DoctorSearchFormManager formManager,
  })  : _getDoctorsUseCase = getDoctorsUseCase,
        _validationService = validationService,
        _formManager = formManager,
        super(const AppointmentInitial());

  DoctorSearchFormManager get formManager => _formManager;
  String? validateSearchQuery(String? query) =>
      _validationService.validateRequiredField(query, 'Search query');

  String? validateSpecialty(String? specialty) =>
      _validationService.validateRequiredField(specialty, 'Specialty');

  Future<void> getDoctors(int doctorSpecialty) async {
    final validationErrors = _validateGetDoctorsInputs(doctorSpecialty);
    if (validationErrors.isNotEmpty) {
      emit(GetDoctorsValidationError(validationErrors));
      return;
    }

    emit(const GetDoctorsLoading());

    try {
      final request =
          GetDoctorsRequestEntity(doctorSpeciality: doctorSpecialty);

      final result = await _getDoctorsUseCase.call(request);

      result.fold(
        (failure) {
          Logging.error('Get doctors failed: ${failure.errMessage}');
          emit(GetDoctorsError(failure.errMessage));
        },
        (response) {
          final doctorsCount = response.doctors?.length ?? 0;
          Logging.info('Get doctors success: $doctorsCount doctors found');
          emit(GetDoctorsSuccess(response));
        },
      );
    } catch (e) {
      Logging.error('Unexpected error in getDoctors: $e');
      emit(const GetDoctorsError(
          'An unexpected error occurred. Please try again.'));
    }
  }

  Map<String, String> _validateGetDoctorsInputs(int doctorSpecialty) {
    final errors = <String, String>{};

    if (doctorSpecialty < 0) {
      errors['specialty'] = 'Please select a valid specialty';
    }

    return errors;
  }

  void clearSearch() {
    _formManager.clearForm();
    emit(const AppointmentInitial());
  }

  @override
  Future<void> close() {
    _formManager.dispose();
    return super.close();
  }
}
