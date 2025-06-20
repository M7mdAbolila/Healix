import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/get_family_group_with_code_usecase.dart';
import '../../../domain/entities/get_family_group_request_entity.dart';
import '../../../data/models/get_family_group_response_model.dart';

part 'get_family_group_state.dart';

class GetFamilyGroupCubit extends Cubit<GetFamilyGroupState> {
  final GetFamilyGroupWithCodeUseCase _getFamilyGroupWithCodeUseCase;

  GetFamilyGroupCubit({
    required GetFamilyGroupWithCodeUseCase getFamilyGroupWithCodeUseCase,
  })  : _getFamilyGroupWithCodeUseCase = getFamilyGroupWithCodeUseCase,
        super(const GetFamilyGroupInitial());

  Future<void> getFamilyGroup() async {
    emit(const GetFamilyGroupLoading());

    try {
      final result = await _getFamilyGroupWithCodeUseCase.call(
        const GetFamilyGroupRequestEntity(code: null),
      );

      result.fold(
        (error) => emit(GetFamilyGroupFailure(error.errMessage)),
        (response) => emit(GetFamilyGroupSuccess(response)),
      );
    } catch (e) {
      emit(const GetFamilyGroupFailure(
          'An unexpected error occurred. Please try again.'));
    }
  }
}
