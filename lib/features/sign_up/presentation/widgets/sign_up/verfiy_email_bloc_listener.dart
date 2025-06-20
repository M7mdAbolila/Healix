import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../../../../../core/dialogs/setup_dialog.dart';
import '../../screens/create_profile_screen.dart';
import '../../state_management/sign_up_cubit.dart';
import '../../state_management/sign_up_state.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: _handleStateChange,
      child: const SizedBox.shrink(),
    );
  }

  void _handleStateChange(BuildContext context, SignUpState state) {
    switch (state) {
      case EmailVerificationLoading():
        _showLoadingDialog(context);
        break;
      case EmailVerifiedSuccess():
        _handleEmailVerificationSuccess(context);
        break;
      case EmailVerificationFailure():
        _handleEmailVerificationFailure(context, state);
        break;
      case SignUpValidationError():
        _handleValidationError(context, state);
        break;
      default:
        break;
    }
  }

  void _showLoadingDialog(BuildContext context) {
    showLoadingDialog(context);
  }

  void _handleEmailVerificationSuccess(BuildContext context) {
    context.pop();
    _showSuccessSnackbar(context);
    _navigateToCreateProfile(context);
  }

  void _showSuccessSnackbar(BuildContext context) {
    showAwesomeSnackbar(
      context,
      title: 'Email Verified',
      message: 'Let\'s create your profile',
    );
  }

  void _navigateToCreateProfile(BuildContext context) {
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider<SignUpCubit>.value(
          value: signUpCubit,
          child: const CreateProfileScreen(),
        ),
      ),
    );
  }

  void _handleEmailVerificationFailure(
    BuildContext context,
    EmailVerificationFailure state,
  ) {
    context.pop();
    showAwesomeSnackbar(
      context,
      title: 'Verification Failed',
      message: state.errorMessage,
      isError: true,
    );
  }

  void _handleValidationError(
    BuildContext context,
    SignUpValidationError state,
  ) {
    final message = state.fieldErrors.entries
        .map((entry) => '${entry.key}: ${entry.value}')
        .join('\n');

    showAwesomeSnackbar(
      context,
      title: 'Validation Error',
      message: message,
      isError: true,
    );
  }
}
