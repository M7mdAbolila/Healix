import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/helpers/logging.dart';
import '../../../domain/entities/get_family_group_request_entity.dart';
import '../../../domain/entities/create_family_group_request_entity.dart';
import '../../../domain/usecases/create_family_group_usecase.dart';
import '../../../domain/usecases/get_family_group_with_code_usecase.dart';
import '../../../domain/usecases/join_family_group_usecase.dart';
import 'family_group_state.dart';

class FamilyGroupCubit extends Cubit<FamilyGroupState> {
  final GetFamilyGroupWithCodeUseCase _getFamilyGroupWithCodeUseCase;
  final CreateFamilyGroupUseCase _createFamilyGroupUseCase;
  final JoinFamilyGroupUseCase _joinFamilyGroupUseCase;

  FamilyGroupCubit(
    this._getFamilyGroupWithCodeUseCase,
    this._createFamilyGroupUseCase,
    this._joinFamilyGroupUseCase,
  ) : super(FamilyGroupInitial());

  void getFamilyGroup() async {
    Logging.info('Fetching family group ');
    emit(GetFamilyGroupLoading());
    final result = await _getFamilyGroupWithCodeUseCase.call(
      const GetFamilyGroupRequestEntity(code: null),
    );
    result.fold(
      (failure) => emit(GetFamilyGroupFailure(failure.errMessage)),
      (success) => emit(GetFamilyGroupSuccess(success)),
    );
  }

  void getFamilyGroupWithCode(String code) async {
    Logging.info('Fetching family group with code');
    emit(FindFamilyGroupLoading());
    final result = await _getFamilyGroupWithCodeUseCase.call(
      GetFamilyGroupRequestEntity(code: code),
    );
    result.fold(
      (failure) => emit(FindFamilyGroupFailure(failure.errMessage)),
      (success) => emit(FindFamilyGroupSuccess(success)),
    );
  }

  void createFamilyGroup(String name) async {
    emit(CreateFamilyGroupLoading());
    final result = await _createFamilyGroupUseCase.call(
      CreateFamilyGroupRequestEntity(name: name),
    );
    result.fold(
      (failure) => emit(CreateFamilyGroupFailure(failure.errMessage)),
      (success) => emit(CreateFamilyGroupSuccess(success)),
    );
  }

  void joinFamilyGroup(String familyGroupId) async {
    emit(JoinFamilyGroupLoading());
    final result = await _joinFamilyGroupUseCase.call(familyGroupId);
    result.fold(
      (failure) => emit(JoinFamilyGroupFailure(failure.errMessage)),
      (success) => emit(JoinFamilyGroupSuccess()),
    );
  }
}
