import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/get_schedule_request_entity.dart';

part 'get_schedule_request_model.g.dart';

@JsonSerializable()
class GetScheduleRequestModel extends GetScheduleRequestEntity {
  const GetScheduleRequestModel({
    super.doctorId,
  });

  factory GetScheduleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetScheduleRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetScheduleRequestModelToJson(this);
}
