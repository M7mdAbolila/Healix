// ignore_for_file: unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.featureScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const FeatureScreen(),
      //   );
      default:
        return null;
    }
  }
}
