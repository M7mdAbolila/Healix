import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/domain/services/input_validation_service.dart';
import '../../../../core/presentation/form/form_manager.dart';
import '../../domain/entities/login_request_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final InputValidationService _validationService;
  final LoginFormManager _formManager;

  LoginCubit(
    LoginUseCase loginUseCase,
    InputValidationService validationService,
    LoginFormManager formManager,
  )   : _loginUseCase = loginUseCase,
        _validationService = validationService,
        _formManager = formManager,
        super(const LoginInitial());

  LoginFormManager get formManager => _formManager;

  String? validateEmail(String? email) =>
      _validationService.validateEmail(email);
  String? validatePassword(String? password) =>
      _validationService.validatePassword(password);

  Future<void> login() async {
    final validationErrors = _validateInputs();
    if (validationErrors.isNotEmpty) {
      emit(LoginValidationError(validationErrors));
      return;
    }

    emit(const LoginLoading());

    try {
      final result = await _loginUseCase.call(
        LoginRequestEntity(
          email: _formManager.emailController.value,
          password: _formManager.passwordController.value,
        ),
      );

      result.fold(
        (error) => emit(
          LoginFailure(error.errMessage),
        ),
        (authResponse) => emit(
          LoginSuccess(authResponse),
        ),
      );
    } catch (e) {
      emit(
        const LoginFailure('An unexpected error occurred. Please try again.'),
      );
    }
  }

  Map<String, String> _validateInputs() {
    final errors = <String, String>{};

    final emailError = _validationService.validateEmail(
      _formManager.emailController.value,
    );
    if (emailError != null) {
      errors['email'] = emailError;
    }

    final passwordError = _validationService.validatePassword(
      _formManager.passwordController.value,
    );
    if (passwordError != null) {
      errors['password'] = passwordError;
    }

    return errors;
  }

  void clearForm() {
    _formManager.clearForm();
    emit(const LoginInitial());
  }

  @override
  Future<void> close() {
    _formManager.dispose();
    return super.close();
  }
}
