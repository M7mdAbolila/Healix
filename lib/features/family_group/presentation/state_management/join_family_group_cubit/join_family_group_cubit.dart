import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/join_family_group_usecase.dart';

part 'join_family_group_state.dart';

class JoinFamilyGroupCubit extends Cubit<JoinFamilyGroupState> {
  final JoinFamilyGroupUseCase _joinFamilyGroupUseCase;

  JoinFamilyGroupCubit({
    required JoinFamilyGroupUseCase joinFamilyGroupUseCase,
  })  : _joinFamilyGroupUseCase = joinFamilyGroupUseCase,
        super(const JoinFamilyGroupInitial());

  Future<void> joinFamilyGroup(String familyGroupId) async {
    emit(const JoinFamilyGroupLoading());

    try {
      final result = await _joinFamilyGroupUseCase.call(familyGroupId);

      result.fold(
        (error) => emit(JoinFamilyGroupFailure(error.errMessage)),
        (_) => emit(const JoinFamilyGroupSuccess()),
      );
    } catch (e) {
      emit(const JoinFamilyGroupFailure(
          'An unexpected error occurred. Please try again.'));
    }
  }
}
