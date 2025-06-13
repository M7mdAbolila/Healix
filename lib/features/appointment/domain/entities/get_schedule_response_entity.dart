import 'package:equatable/equatable.dart';
import 'schedule_entity.dart';

class GetScheduleResponseEntity extends Equatable {
  final ScheduleEntity? schedule;

  const GetScheduleResponseEntity({
    this.schedule,
  });

  @override
  List<Object?> get props => [schedule];
}
