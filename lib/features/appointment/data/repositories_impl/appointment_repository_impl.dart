import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../domain/entities/entities.dart';
import '../../domain/entities/get_schedule_request_entity.dart';
import '../../domain/entities/get_schedule_response_entity.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_api_service.dart';
import '../models/get_doctors_request_model.dart';
import '../models/get_schedule_request_model.dart';
import '../models/book_appointment_request_model.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentApiService apiService;

  AppointmentRepositoryImpl(this.apiService);

  @override
  Future<Either<ApiErrorModel, GetDoctorsResponseEntity>> getDoctors(
      GetDoctorsRequestEntity request) async {
    final GetDoctorsRequestModel requestModel = GetDoctorsRequestModel(
      doctorSpeciality: request.doctorSpeciality,
    );
    try {
      final response = await apiService.getDoctors(requestModel);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, GetScheduleResponseEntity>> getSchedule(
    GetScheduleRequestEntity request,
  ) async {
    final GetScheduleRequestModel requestModel = GetScheduleRequestModel(
      doctorId: request.doctorId,
    );

    try {
      final response = await apiService.getSchedule(requestModel);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, BookAppointmentResponseEntity>> bookAppointment(
    BookAppointmentRequestEntity request,
  ) async {
    final BookAppointmentRequestModel requestModel =
        BookAppointmentRequestModel(
      day: request.day,
      from: request.from,
      to: request.to,
      doctorId: request.doctorId,
    );

    try {
      final response = await apiService.bookAppointment(requestModel);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
