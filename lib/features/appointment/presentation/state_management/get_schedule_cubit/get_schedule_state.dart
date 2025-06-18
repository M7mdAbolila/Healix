import 'package:equatable/equatable.dart';
import '../../../domain/entities/get_schedule_response_entity.dart';

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
  final String errorMessage;

  const GetScheduleFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class GetScheduleValidationError extends GetScheduleState {
  final Map<String, String> fieldErrors;

  const GetScheduleValidationError(this.fieldErrors);

  @override
  List<Object?> get props => [fieldErrors];
}
