import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/domain/services/input_validation_service.dart';
import '../../../../../core/presentation/form/form_manager.dart';
import '../../../domain/entities/get_family_group_request_entity.dart';
import '../../../domain/usecases/get_family_group_with_code_usecase.dart';
import '../../../data/models/get_family_group_response_model.dart';

part 'find_family_group_state.dart';

class FindFamilyGroupCubit extends Cubit<FindFamilyGroupState> {
  final GetFamilyGroupWithCodeUseCase _getFamilyGroupWithCodeUseCase;
  final InputValidationService _validationService;
  final FamilyGroupFormManager _formManager;

  FindFamilyGroupCubit({
    required GetFamilyGroupWithCodeUseCase getFamilyGroupWithCodeUseCase,
    required InputValidationService validationService,
    required FamilyGroupFormManager formManager,
  })  : _getFamilyGroupWithCodeUseCase = getFamilyGroupWithCodeUseCase,
        _validationService = validationService,
        _formManager = formManager,
        super(const FindFamilyGroupInitial());

  FamilyGroupFormManager get formManager => _formManager;

  String? validateFamilyCode(String? code) =>
      _validationService.validateNumericField(code, 'Family code');

  Future<void> findFamilyGroup() async {
    final validationErrors = _validateInputs();
    if (validationErrors.isNotEmpty) {
      emit(FindFamilyGroupValidationError(validationErrors));
      return;
    }

    emit(const FindFamilyGroupLoading());

    try {
      final result = await _getFamilyGroupWithCodeUseCase.call(
        GetFamilyGroupRequestEntity(
          code: _formManager.familyCodeController.value.trim(),
        ),
      );

      result.fold(
        (error) => emit(FindFamilyGroupFailure(error.errMessage)),
        (response) => emit(FindFamilyGroupSuccess(response)),
      );
    } catch (e) {
      emit(const FindFamilyGroupFailure(
          'An unexpected error occurred. Please try again.'));
    }
  }

  Map<String, String> _validateInputs() {
    final errors = <String, String>{};

    final codeError = validateFamilyCode(
      _formManager.familyCodeController.value,
    );
    if (codeError != null) {
      errors['code'] = codeError;
    }

    return errors;
  }

  void clearForm() {
    _formManager.clearForm();
    emit(const FindFamilyGroupInitial());
  }

  @override
  Future<void> close() {
    _formManager.dispose();
    return super.close();
  }
}
