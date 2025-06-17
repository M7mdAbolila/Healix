import 'package:equatable/equatable.dart';
import '../../../../core/domain/entities/auth_response_entity.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

class SignUpSuccess extends SignUpState {
  final AuthResponseEntity authResponse;

  const SignUpSuccess(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class SignUpFailure extends SignUpState {
  final String errorMessage;

  const SignUpFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class SignUpValidationError extends SignUpState {
  final Map<String, String> fieldErrors;

  const SignUpValidationError(this.fieldErrors);

  @override
  List<Object?> get props => [fieldErrors];
}

class EmailVerificationLoading extends SignUpState {
  const EmailVerificationLoading();
}

class EmailVerifiedSuccess extends SignUpState {
  const EmailVerifiedSuccess();
}

class EmailVerificationFailure extends SignUpState {
  final String errorMessage;

  const EmailVerificationFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ProfileImagePickedSuccess extends SignUpState {
  const ProfileImagePickedSuccess();
}
