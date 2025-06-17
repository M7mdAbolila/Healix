import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/functions/save_user_data.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';

import '../../state_management/sign_up_cubit.dart';
import '../../state_management/sign_up_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        _handleStateChange(context, state);
      },
      child: const SizedBox.shrink(),
    );
  }

  void _handleStateChange(BuildContext context, SignUpState state) {
    switch (state) {
      case SignUpSuccess():
        _handleSignUpSuccess(context, state);
        break;
      case SignUpFailure():
        _handleSignUpFailure(context, state);
        break;
      case SignUpLoading():
        _handleSignUpLoading(context);
        break;
      case SignUpValidationError():
        _handleValidationError(context, state);
        break;
      default:
        break;
    }
  }

  void _handleSignUpSuccess(BuildContext context, SignUpSuccess state) {
    _saveUserData(state);

    showAwesomeSnackbar(
      context,
      title: 'Sign Up Successful',
      message: 'Welcome to Healix, ${state.authResponse.user.firstName}!',
      isError: false,
    );

    context.pushNamedAndRemoveUntil(
      Routes.mainLayoutScreen,
      predicate: (route) => false,
    );
  }

  void _handleSignUpFailure(BuildContext context, SignUpFailure state) {
    context.pop();
    showAwesomeSnackbar(
      context,
      title: 'Sign Up Failed',
      message: state.errorMessage,
      isError: true,
    );
  }

  void _handleSignUpLoading(BuildContext context) {
    showLoadingDialog(context);
  }

  void _handleValidationError(
      BuildContext context, SignUpValidationError state) {
    context.pop();
    final firstError = state.fieldErrors.values.first;
    showAwesomeSnackbar(
      context,
      title: 'Validation Error',
      message: firstError,
      isError: true,
    );
  }

  void _saveUserData(SignUpSuccess state) {
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
