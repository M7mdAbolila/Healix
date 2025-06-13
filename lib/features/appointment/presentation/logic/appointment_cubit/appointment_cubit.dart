import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healix/core/helpers/logging.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_doctors_usecase.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final GetDoctorsUseCase getDoctorsUseCase;

  AppointmentCubit(this.getDoctorsUseCase) : super(const AppointmentInitial());

  Future<void> getDoctors(int doctorSpeciality) async {
    emit(const GetDoctorsLoading());

    final request = GetDoctorsRequestEntity(doctorSpeciality: doctorSpeciality);

    final result = await getDoctorsUseCase.call(request);
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
  }
}
