import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/healix_app.dart';

import 'core/di/setup_get_it.dart';
import 'core/functions/check_if_logged_in_user.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(
    HealixApp(
      appRouter: AppRouter(),
    ),
  );
}
