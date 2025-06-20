import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/entities.dart';
import '../repositories/appointment_repository.dart';

class BookAppointmentUseCase {
  final AppointmentRepository repository;

  BookAppointmentUseCase(this.repository);

  Future<Either<ApiErrorModel, BookAppointmentResponseEntity>> call(
    BookAppointmentRequestEntity request,
  ) async {
    return await repository.bookAppointment(request);
  }
}
