import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/get_schedule_response_entity.dart';
import 'schedule_model.dart';

part 'get_schedule_response_model.g.dart';

@JsonSerializable()
class GetScheduleResponseModel extends GetScheduleResponseEntity {
  @override
  @JsonKey(name: 'schedule')
  final ScheduleModel? schedule;

  const GetScheduleResponseModel({
    this.schedule,
  }) : super(schedule: schedule);

  factory GetScheduleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetScheduleResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetScheduleResponseModelToJson(this);
}
