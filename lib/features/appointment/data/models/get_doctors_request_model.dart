import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/get_doctors_request_entity.dart';

part 'get_doctors_request_model.g.dart';

@JsonSerializable()
class GetDoctorsRequestModel extends GetDoctorsRequestEntity {
  const GetDoctorsRequestModel({
    required super.doctorSpeciality,
  });

  factory GetDoctorsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetDoctorsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDoctorsRequestModelToJson(this);

  factory GetDoctorsRequestModel.fromEntity(GetDoctorsRequestEntity entity) {
    return GetDoctorsRequestModel(
      doctorSpeciality: entity.doctorSpeciality,
    );
  }
}
