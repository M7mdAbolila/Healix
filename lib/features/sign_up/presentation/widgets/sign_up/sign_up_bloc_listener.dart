import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/functions/save_user_data.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/routing/routes.dart';

import '../../logic/sign_up_cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          saveUserData(state: state);
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Sign Up Successful',
            message:
                'Welcome to Healix, ${state.response.user?.user?.fname ?? ''}!',
          );
          context.pushNamedAndRemoveUntil(
            Routes.mainLayoutScreen,
            predicate: (route) => false,
          );
        } else if (state is SignUpFailure) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Sign Up Failed',
            message: state.errMessage,
            isError: true,
          );
        } else {
          showLoadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
