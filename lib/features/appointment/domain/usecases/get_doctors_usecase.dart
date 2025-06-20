import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/entities.dart';
import '../repositories/appointment_repository.dart';

class GetDoctorsUseCase {
  final AppointmentRepository repository;

  GetDoctorsUseCase(this.repository);

  Future<Either<ApiErrorModel, GetDoctorsResponseEntity>> call(
    GetDoctorsRequestEntity request,
  ) async {
    return await repository.getDoctors(request);
  }
}
