import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/get_schedule_request_entity.dart';
import '../entities/get_schedule_response_entity.dart';
import '../repositories/appointment_repository.dart';

class GetScheduleUseCase {
  final AppointmentRepository repository;
  GetScheduleUseCase(this.repository);

  Future<Either<ApiErrorModel, GetScheduleResponseEntity>> call(
    GetScheduleRequestEntity request,
  ) {
    return repository.getSchedule(request);
  }
}
