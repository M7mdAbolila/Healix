import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healix/core/helpers/logging.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/book_appointment_usecase.dart';

part 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final BookAppointmentUseCase bookAppointmentUseCase;

  BookAppointmentCubit(this.bookAppointmentUseCase)
      : super(const BookAppointmentInitial());

  Future<void> bookAppointment({
    required String day,
    required String from,
    required String to,
    required String doctorId,
  }) async {
    emit(const BookAppointmentLoading());

    final request = BookAppointmentRequestEntity(
      day: day,
      from: from,
      to: to,
      doctorId: doctorId,
    );

    final result = await bookAppointmentUseCase.call(request);
    result.fold(
      (failure) {
        Logging.error('Book appointment failed: ${failure.errMessage}');
        emit(BookAppointmentError(failure.errMessage));
      },
      (response) {
        Logging.info('Book appointment success: ${response.appointment?.id}');
        emit(BookAppointmentSuccess(response));
      },
    );
  }

  void resetState() {
    emit(const BookAppointmentInitial());
  }
}
