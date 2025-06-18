part of 'create_family_group_cubit.dart';

abstract class CreateFamilyGroupState extends Equatable {
  const CreateFamilyGroupState();

  @override
  List<Object?> get props => [];
}

class CreateFamilyGroupInitial extends CreateFamilyGroupState {
  const CreateFamilyGroupInitial();
}

class CreateFamilyGroupLoading extends CreateFamilyGroupState {
  const CreateFamilyGroupLoading();
}

class CreateFamilyGroupSuccess extends CreateFamilyGroupState {
  final CreateFamilyGroupResponseModel response;

  const CreateFamilyGroupSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class CreateFamilyGroupFailure extends CreateFamilyGroupState {
  final String errorMessage;

  const CreateFamilyGroupFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CreateFamilyGroupValidationError extends CreateFamilyGroupState {
  final Map<String, String> fieldErrors;

  const CreateFamilyGroupValidationError(this.fieldErrors);

  @override
  List<Object?> get props => [fieldErrors];
}
