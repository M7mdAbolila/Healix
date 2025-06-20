part of 'find_family_group_cubit.dart';

abstract class FindFamilyGroupState extends Equatable {
  const FindFamilyGroupState();

  @override
  List<Object?> get props => [];
}

class FindFamilyGroupInitial extends FindFamilyGroupState {
  const FindFamilyGroupInitial();
}

class FindFamilyGroupLoading extends FindFamilyGroupState {
  const FindFamilyGroupLoading();
}

class FindFamilyGroupSuccess extends FindFamilyGroupState {
  final GetFamilyGroupResponseModel response;

  const FindFamilyGroupSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class FindFamilyGroupFailure extends FindFamilyGroupState {
  final String errorMessage;

  const FindFamilyGroupFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class FindFamilyGroupValidationError extends FindFamilyGroupState {
  final Map<String, String> fieldErrors;

  const FindFamilyGroupValidationError(this.fieldErrors);

  @override
  List<Object?> get props => [fieldErrors];
}
