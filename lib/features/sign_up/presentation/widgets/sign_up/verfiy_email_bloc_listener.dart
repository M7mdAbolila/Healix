import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/features/sign_up/presentation/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:healix/features/sign_up/presentation/screens/create_profile_screen.dart';

import '../../../../../core/dialogs/setup_dialog.dart';

class VerfiyEmailBlocListener extends StatelessWidget {
  const VerfiyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showLoadingDialog(context);
        } else if (state is EmailVerifiedSuccess) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Sign Up Successful',
            message: 'Let\'s create your profile',
          );
          final signUpCubit = BlocProvider.of<SignUpCubit>(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BlocProvider<SignUpCubit>.value(
                  value: signUpCubit,
                  child: const CreateProfileScreen(),
                );
              },
            ),
          );
        } else if (state is SignUpFailure) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Verification Failed',
            message: state.errMessage,
            isError: true,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
