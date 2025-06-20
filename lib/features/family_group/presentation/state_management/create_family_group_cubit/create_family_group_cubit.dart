import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/domain/services/input_validation_service.dart';
import '../../../../../core/presentation/form/form_manager.dart';
import '../../../domain/entities/create_family_group_request_entity.dart';
import '../../../domain/usecases/create_family_group_usecase.dart';
import '../../../data/models/create_family_group_response_model.dart';

part 'create_family_group_state.dart';

class CreateFamilyGroupCubit extends Cubit<CreateFamilyGroupState> {
  final CreateFamilyGroupUseCase _createFamilyGroupUseCase;
  final InputValidationService _validationService;
  final FamilyGroupFormManager _formManager;

  CreateFamilyGroupCubit({
    required CreateFamilyGroupUseCase createFamilyGroupUseCase,
    required InputValidationService validationService,
    required FamilyGroupFormManager formManager,
  })  : _createFamilyGroupUseCase = createFamilyGroupUseCase,
        _validationService = validationService,
        _formManager = formManager,
        super(const CreateFamilyGroupInitial());

  FamilyGroupFormManager get formManager => _formManager;
  String? validateFamilyName(String? name) =>
      _validationService.validateRequiredField(name, 'Family name');

  Future<void> createFamilyGroup() async {
    final validationErrors = _validateInputs();
    if (validationErrors.isNotEmpty) {
      emit(CreateFamilyGroupValidationError(validationErrors));
      return;
    }

    emit(const CreateFamilyGroupLoading());

    try {
      final result = await _createFamilyGroupUseCase.call(
        CreateFamilyGroupRequestEntity(
          name: _formManager.familyNameController.value.trim(),
        ),
      );

      result.fold(
        (error) => emit(CreateFamilyGroupFailure(error.errMessage)),
        (response) => emit(CreateFamilyGroupSuccess(response)),
      );
    } catch (e) {
      emit(const CreateFamilyGroupFailure(
          'An unexpected error occurred. Please try again.'));
    }
  }

  Map<String, String> _validateInputs() {
    final errors = <String, String>{};

    final nameError = validateFamilyName(
      _formManager.familyNameController.value,
    );
    if (nameError != null) {
      errors['name'] = nameError;
    }

    return errors;
  }

  void clearForm() {
    _formManager.clearForm();
    emit(const CreateFamilyGroupInitial());
  }

  @override
  Future<void> close() {
    _formManager.dispose();
    return super.close();
  }
}
