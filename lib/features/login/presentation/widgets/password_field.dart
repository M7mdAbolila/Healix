import 'package:flutter/material.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  const PasswordField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.textInputAction,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      title: widget.title,
      hintText: widget.hintText,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      isObscureText: !_isPasswordVisible,
      suffixIcon: IconButton(
        icon: _isPasswordVisible
            ? Assets.svgs.passEyeSlash.svg()
            : Assets.svgs.passEye.svg(),
        onPressed: _togglePasswordVisibility,
      ),
      validator: widget.validator,
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}
