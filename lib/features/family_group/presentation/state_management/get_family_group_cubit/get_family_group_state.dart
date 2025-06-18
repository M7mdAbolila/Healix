part of 'get_family_group_cubit.dart';

abstract class GetFamilyGroupState extends Equatable {
  const GetFamilyGroupState();

  @override
  List<Object?> get props => [];
}

class GetFamilyGroupInitial extends GetFamilyGroupState {
  const GetFamilyGroupInitial();
}

class GetFamilyGroupLoading extends GetFamilyGroupState {
  const GetFamilyGroupLoading();
}

class GetFamilyGroupSuccess extends GetFamilyGroupState {
  final GetFamilyGroupResponseModel response;

  const GetFamilyGroupSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class GetFamilyGroupFailure extends GetFamilyGroupState {
  final String errorMessage;

  const GetFamilyGroupFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
