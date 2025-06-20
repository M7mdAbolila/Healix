import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/entities.dart';
import '../entities/get_schedule_request_entity.dart';
import '../entities/get_schedule_response_entity.dart';

abstract class AppointmentRepository {
  Future<Either<ApiErrorModel, GetDoctorsResponseEntity>> getDoctors(
      GetDoctorsRequestEntity request);
  Future<Either<ApiErrorModel, GetScheduleResponseEntity>> getSchedule(
    GetScheduleRequestEntity request,
  );
  Future<Either<ApiErrorModel, BookAppointmentResponseEntity>> bookAppointment(
    BookAppointmentRequestEntity request,
  );
}
