import 'package:equatable/equatable.dart';
import '../../../data/models/get_family_group_response_model.dart';
import '../../../data/models/create_family_group_response_model.dart';

abstract class FamilyGroupState extends Equatable {
  const FamilyGroupState();

  @override
  List<Object?> get props => [];
}

class FamilyGroupInitial extends FamilyGroupState {}

class GetFamilyGroupLoading extends FamilyGroupState {}

class FindFamilyGroupLoading extends FamilyGroupState {}

class CreateFamilyGroupLoading extends FamilyGroupState {}

class JoinFamilyGroupLoading extends FamilyGroupState {}

class GetFamilyGroupSuccess extends FamilyGroupState {
  final GetFamilyGroupResponseModel familyGroupResponse;

  const GetFamilyGroupSuccess(this.familyGroupResponse);

  @override
  List<Object> get props => [familyGroupResponse];
}

class FindFamilyGroupSuccess extends FamilyGroupState {
  final GetFamilyGroupResponseModel familyGroupResponse;

  const FindFamilyGroupSuccess(this.familyGroupResponse);

  @override
  List<Object> get props => [familyGroupResponse];
}

class CreateFamilyGroupSuccess extends FamilyGroupState {
  final CreateFamilyGroupResponseModel createFamilyGroupResponse;

  const CreateFamilyGroupSuccess(this.createFamilyGroupResponse);

  @override
  List<Object> get props => [createFamilyGroupResponse];
}

class JoinFamilyGroupSuccess extends FamilyGroupState {}

class CreateFamilyGroupFailure extends FamilyGroupState {
  final String errMessage;

  const CreateFamilyGroupFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

class GetFamilyGroupFailure extends FamilyGroupState {
  final String errMessage;

  const GetFamilyGroupFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

class FindFamilyGroupFailure extends FamilyGroupState {
  final String errMessage;

  const FindFamilyGroupFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

class JoinFamilyGroupFailure extends FamilyGroupState {
  final String errMessage;

  const JoinFamilyGroupFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
