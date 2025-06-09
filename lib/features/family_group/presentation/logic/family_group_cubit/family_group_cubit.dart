import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/get_family_group_request_entity.dart';
import '../../../domain/entities/create_family_group_request_entity.dart';
import '../../../domain/usecases/get_family_group_usecase.dart';
import '../../../domain/usecases/create_family_group_usecase.dart';
import '../../../domain/usecases/join_family_group_usecase.dart';
import 'family_group_state.dart';

class FamilyGroupCubit extends Cubit<FamilyGroupState> {
  final GetFamilyGroupUseCase _getFamilyGroupUseCase;
  final CreateFamilyGroupUseCase _createFamilyGroupUseCase;
  final JoinFamilyGroupUseCase _joinFamilyGroupUseCase;

  FamilyGroupCubit(
    this._getFamilyGroupUseCase,
    this._createFamilyGroupUseCase,
    this._joinFamilyGroupUseCase,
  ) : super(FamilyGroupInitial());

  void getFamilyGroup({String? code}) async {
    emit(FamilyGroupLoading());
    final result = await _getFamilyGroupUseCase(
      GetFamilyGroupRequestEntity(code: code),
    );
    result.fold(
      (failure) => emit(FamilyGroupFailure(failure.errMessage)),
      (success) => emit(GetFamilyGroupSuccess(success)),
    );
  }

  void createFamilyGroup(String name) async {
    emit(FamilyGroupLoading());
    final result = await _createFamilyGroupUseCase(
      CreateFamilyGroupRequestEntity(name: name),
    );
    result.fold(
      (failure) => emit(FamilyGroupFailure(failure.errMessage)),
      (success) => emit(CreateFamilyGroupSuccess(success)),
    );
  }

  void joinFamilyGroup(String familyGroupId) async {
    emit(FamilyGroupLoading());
    final result = await _joinFamilyGroupUseCase(familyGroupId);
    result.fold(
      (failure) => emit(FamilyGroupFailure(failure.errMessage)),
      (success) => emit(JoinFamilyGroupSuccess()),
    );
  }
}
