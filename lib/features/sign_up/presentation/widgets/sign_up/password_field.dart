import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../state_management/sign_up_cubit.dart';

class PasswordField extends StatefulWidget {
  final bool isConfirmPassword;

  const PasswordField({
    super.key,
    this.isConfirmPassword = false,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return CustomTextFormField(
      title: widget.isConfirmPassword ? 'Confirm Password' : 'Password',
      hintText: widget.isConfirmPassword
          ? 'Confirm Your New Password'
          : 'Create New Password',
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.isConfirmPassword
          ? TextInputAction.done
          : TextInputAction.next,
      isObscureText: !_isVisible,
      controller: widget.isConfirmPassword
          ? cubit.signUpFormManager.confirmPasswordController.controller
          : cubit.signUpFormManager.passwordController.controller,
      suffixIcon: IconButton(
        icon: _isVisible
            ? Assets.svgs.passEyeSlash.svg()
            : Assets.svgs.passEye.svg(),
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
        },
      ),
      validator: widget.isConfirmPassword
          ? (value) => cubit.validateConfirmPassword(
                cubit.signUpFormManager.passwordController.value,
                value,
              )
          : cubit.validatePassword,
    );
  }
}
