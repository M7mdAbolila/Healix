import 'package:equatable/equatable.dart';
import '../../../data/models/get_family_group_response_model.dart';
import '../../../data/models/create_family_group_response_model.dart';

abstract class FamilyGroupState extends Equatable {
  const FamilyGroupState();

  @override
  List<Object?> get props => [];
}

class FamilyGroupInitial extends FamilyGroupState {}

class FamilyGroupLoading extends FamilyGroupState {}

class GetFamilyGroupSuccess extends FamilyGroupState {
  final GetFamilyGroupResponseModel familyGroupResponse;

  const GetFamilyGroupSuccess(this.familyGroupResponse);

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

class FamilyGroupFailure extends FamilyGroupState {
  final String errMessage;

  const FamilyGroupFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
