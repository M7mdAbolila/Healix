// ignore_for_file: unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/features/onboarding/presentation/onboarding_screen.dart';
import 'package:healix/features/sign_up/presentation/screens/sign_up_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.featureScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const FeatureScreen(),
      //   );
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      default:
        return null;
    }
  }
}
