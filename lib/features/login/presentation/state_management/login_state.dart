import 'package:equatable/equatable.dart';
import '../../../../core/domain/entities/auth_response_entity.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final AuthResponseEntity authResponse;

  const LoginSuccess(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class LoginValidationError extends LoginState {
  final Map<String, String> fieldErrors;

  const LoginValidationError(this.fieldErrors);

  @override
  List<Object?> get props => [fieldErrors];
}
