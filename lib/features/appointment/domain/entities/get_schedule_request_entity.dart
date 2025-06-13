import 'package:equatable/equatable.dart';

class GetScheduleRequestEntity extends Equatable {
  final String? doctorId;

  const GetScheduleRequestEntity({
    this.doctorId,
  });

  @override
  List<Object?> get props => [doctorId];
}
