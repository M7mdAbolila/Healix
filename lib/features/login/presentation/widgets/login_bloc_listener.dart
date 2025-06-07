import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/extensions.dart';
import 'package:healix/core/helpers/shared_pref_keys.dart';
import 'package:healix/core/networking/dio_factory.dart';
import 'package:healix/core/routing/routes.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../logic/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            state.response.token ?? '',
          );
          SharedPrefHelper.setData(
            SharedPrefKeys.userPhotoUrl,
            state.response.user?.user?.photoUrl ?? '',
          );
          DioFactory.setTokenIntoHeaderAfterLogin(state.response.token ?? '');
          showAwesomeSnackbar(
            context,
            title: 'Login Successful',
            message: 'Welcome back, ${state.response.user?.user?.fname ?? ''}!',
            isError: false,
          );
          context.pushNamedAndRemoveUntil(Routes.mainLayoutScreen,
              predicate: (route) => false);
        } else if (state is LoginFailure) {
          context.pop();
          showAwesomeSnackbar(
            context,
            title: 'Login Failed',
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
