import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';

void showAwesomeSnackbar(
  BuildContext context, {
  required String title,
  required String message,
  bool isError = false,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: isError ? ContentType.failure : ContentType.success,
        ),
      ),
    );
}

showLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.blue60,
        strokeWidth: 5.0,
      ),
    ),
  );
}

showErrorSnackBar(BuildContext context, String errMessage) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errMessage),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.red,
    ),
  );
}

showSuccessSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.green,
    ),
  );
}
