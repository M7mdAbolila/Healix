part of 'join_family_group_cubit.dart';

abstract class JoinFamilyGroupState extends Equatable {
  const JoinFamilyGroupState();

  @override
  List<Object?> get props => [];
}

class JoinFamilyGroupInitial extends JoinFamilyGroupState {
  const JoinFamilyGroupInitial();
}

class JoinFamilyGroupLoading extends JoinFamilyGroupState {
  const JoinFamilyGroupLoading();
}

class JoinFamilyGroupSuccess extends JoinFamilyGroupState {
  const JoinFamilyGroupSuccess();
}

class JoinFamilyGroupFailure extends JoinFamilyGroupState {
  final String errorMessage;

  const JoinFamilyGroupFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
