import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/colors_manager.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class HealixPatientApp extends StatelessWidget {
  const HealixPatientApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Healix Patient',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.dimmedBackground,
        ),
        initialRoute: Routes.myFamilyScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
