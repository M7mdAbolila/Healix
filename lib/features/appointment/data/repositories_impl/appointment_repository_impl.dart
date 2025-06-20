import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../domain/entities/entities.dart';
import '../../domain/entities/get_schedule_request_entity.dart';
import '../../domain/entities/get_schedule_response_entity.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_api_service.dart';
import '../mappers/appointment_data_mapper.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentApiService apiService;

  AppointmentRepositoryImpl(this.apiService);

  @override
  Future<Either<ApiErrorModel, GetDoctorsResponseEntity>> getDoctors(
      GetDoctorsRequestEntity request) async {
    try {
      final requestModel = AppointmentDataMapper.toDoctorsRequestModel(request);
      final response = await apiService.getDoctors(requestModel);
      return right(AppointmentDataMapper.toDoctorsResponseEntity(response));
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, GetScheduleResponseEntity>> getSchedule(
    GetScheduleRequestEntity request,
  ) async {
    try {
      final requestModel =
          AppointmentDataMapper.toScheduleRequestModel(request);
      final response = await apiService.getSchedule(requestModel);
      return right(AppointmentDataMapper.toScheduleResponseEntity(response));
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, BookAppointmentResponseEntity>> bookAppointment(
    BookAppointmentRequestEntity request,
  ) async {
    try {
      final requestModel =
          AppointmentDataMapper.toBookAppointmentRequestModel(request);
      final response = await apiService.bookAppointment(requestModel);
      return right(
          AppointmentDataMapper.toBookAppointmentResponseEntity(response));
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
