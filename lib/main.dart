import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/healix_app.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // await setupGetIt();
  // await checkIfLoggedInUser();
  runApp(
    HealixApp(
      appRouter: AppRouter(),
    ),
  );
}
