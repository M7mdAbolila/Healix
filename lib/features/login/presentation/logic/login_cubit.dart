import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_model.dart';
import '../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(const LoginInitial());

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  Future<void> login() async {
    emit(const LoginLoading());
    final result = await loginUseCase.call(
      LoginRequestModel(
        email: email.text,
        password: password.text,
      ),
    );
    result.fold(
      (error) => emit(
        LoginFailure(error.errMessage),
      ),
      (response) => emit(
        LoginSuccess(response),
      ),
    );
  }
}
