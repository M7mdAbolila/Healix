import '../../domain/entities/entities.dart';
import '../../domain/entities/get_schedule_request_entity.dart';
import '../../domain/entities/get_schedule_response_entity.dart';
import '../models/models.dart';

class AppointmentDataMapper {
  static GetDoctorsRequestModel toDoctorsRequestModel(
    GetDoctorsRequestEntity entity,
  ) {
    return GetDoctorsRequestModel(
      doctorSpeciality: entity.doctorSpeciality,
    );
  }

  static GetDoctorsResponseEntity toDoctorsResponseEntity(
    GetDoctorsResponseModel model,
  ) {
    return model;
  }

  static GetScheduleRequestModel toScheduleRequestModel(
    GetScheduleRequestEntity entity,
  ) {
    return GetScheduleRequestModel(
      doctorId: entity.doctorId,
    );
  }

  static GetScheduleResponseEntity toScheduleResponseEntity(
    GetScheduleResponseModel model,
  ) {
    return model;
  }

  static BookAppointmentRequestModel toBookAppointmentRequestModel(
    BookAppointmentRequestEntity entity,
  ) {
    return BookAppointmentRequestModel(
      day: entity.day,
      from: entity.from,
      to: entity.to,
      doctorId: entity.doctorId,
    );
  }

  static BookAppointmentResponseEntity toBookAppointmentResponseEntity(
    BookAppointmentResponseModel model,
  ) {
    return model;
  }
}
