import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dialogs/setup_dialog.dart';
import '../../../../core/functions/save_user_data.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../state_management/login_cubit.dart';
import '../state_management/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        _handleStateChange(context, state);
      },
      child: const SizedBox.shrink(),
    );
  }

  void _handleStateChange(BuildContext context, LoginState state) {
    switch (state) {
      case LoginSuccess():
        _handleLoginSuccess(context, state);
        break;
      case LoginFailure():
        _handleLoginFailure(context, state);
        break;
      case LoginLoading():
        _handleLoginLoading(context);
        break;
      case LoginValidationError():
        _handleValidationError(context, state);
        break;
      default:
        break;
    }
  }

  void _handleLoginSuccess(BuildContext context, LoginSuccess state) {
    _saveUserData(state);

    showAwesomeSnackbar(
      context,
      title: 'Login Successful',
      message: 'Welcome back, ${state.authResponse.user.firstName}!',
      isError: false,
    );

    context.pushNamedAndRemoveUntil(
      Routes.mainLayoutScreen,
      predicate: (route) => false,
    );
  }

  void _handleLoginFailure(BuildContext context, LoginFailure state) {
    context.pop();
    showAwesomeSnackbar(
      context,
      title: 'Login Failed',
      message: state.errorMessage,
      isError: true,
    );
  }

  void _handleLoginLoading(BuildContext context) {
    showLoadingDialog(context);
  }

  void _handleValidationError(
      BuildContext context, LoginValidationError state) {
    final title = 'Validation Error';
    final message =
        state.fieldErrors.entries.map((e) => '${e.key}: ${e.value}').join('\n');
    showAwesomeSnackbar(
      context,
      title: title,
      message: message,
      isError: true,
    );
  }

  void _saveUserData(LoginSuccess state) {
    final authResponse = state.authResponse;
    final user = authResponse.user;

    final responseData = _ConvertedResponse(
      token: authResponse.token,
      user: _ConvertedUserWrapper(
        user: _ConvertedUser(
          fname: user.firstName,
          lname: user.lastName,
          photoUrl: user.photoUrl,
        ),
      ),
    );

    saveUserData(state: _ConvertedState(response: responseData));
  }
}

class _ConvertedState {
  final _ConvertedResponse response;
  _ConvertedState({required this.response});
}

class _ConvertedResponse {
  final String token;
  final _ConvertedUserWrapper user;
  _ConvertedResponse({required this.token, required this.user});
}

class _ConvertedUserWrapper {
  final _ConvertedUser user;
  _ConvertedUserWrapper({required this.user});
}

class _ConvertedUser {
  final String fname;
  final String lname;
  final String? photoUrl;
  _ConvertedUser({required this.fname, required this.lname, this.photoUrl});
}
