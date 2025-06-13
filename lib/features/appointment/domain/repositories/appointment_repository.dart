import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../entities/entities.dart';

abstract class AppointmentRepository {
  Future<Either<ApiErrorModel, GetDoctorsResponseEntity>> getDoctors(
      GetDoctorsRequestEntity request);
}
