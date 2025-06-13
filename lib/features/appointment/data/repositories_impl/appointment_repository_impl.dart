import 'package:dartz/dartz.dart';
import 'package:healix/core/networking/api_error_handler.dart';
import 'package:healix/core/networking/api_error_model.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_api_service.dart';
import '../models/get_doctors_request_model.dart';

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
}
