part of 'get_schedule_cubit.dart';

abstract class GetScheduleState extends Equatable {
  const GetScheduleState();

  @override
  List<Object?> get props => [];
}

class GetScheduleInitial extends GetScheduleState {
  const GetScheduleInitial();
}

class GetScheduleLoading extends GetScheduleState {
  const GetScheduleLoading();
}

class GetScheduleSuccess extends GetScheduleState {
  final GetScheduleResponseEntity response;
  const GetScheduleSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class GetScheduleFailure extends GetScheduleState {
  final String errMessage;
  const GetScheduleFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
