import 'package:flutter/material.dart';

import '../theming/colors.dart';

showLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.color,
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
