part of 'sign_up_cubit.dart';

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
  final SignUpResponseModel response;
  const SignUpSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class SignUpFailure extends SignUpState {
  final String errMessage;
  const SignUpFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}

class PickedProfileImageSuccess extends SignUpState {
  const PickedProfileImageSuccess();
}

class EmailVerifiedSuccess extends SignUpState {
  const EmailVerifiedSuccess();
}
