// ignore_for_file: unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/features/chat_bot/presentation/logic/chat_cubit/chat_cubit.dart';
import 'package:healix/features/chat_bot/presentation/screens/chat_bot_screen.dart';
import 'package:healix/features/forget_password/presentation/screens/enter_otp_screen.dart';
import 'package:healix/features/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:healix/features/forget_password/presentation/screens/reset_pass_screen.dart';
import 'package:healix/features/login/presentation/screens/login_screen.dart';
import 'package:healix/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:healix/features/onboarding/presentation/onboarding_screen.dart';
import 'package:healix/features/sign_up/presentation/add_medical_history/add_medical_history_screen.dart';
import 'package:healix/features/sign_up/presentation/chronic_disease/chronic_disease_screen.dart';
import 'package:healix/features/sign_up/presentation/physical_info/screens/physical_info_screen.dart';
import 'package:healix/features/sign_up/presentation/sign_up/screens/sign_up_screen.dart';

import '../../features/chat_bot/presentation/screens/chat_screen.dart';
import '../../features/sign_up/presentation/create_profile/screens/create_profile_screen.dart';
import '../../features/forget_password/presentation/screens/two_factor_auth_screen.dart';
import '../../features/verify_email/presentation/screens/verify_email_screen.dart';
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
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.verifyEmailScreen:
        return MaterialPageRoute(
          builder: (_) => const VerfiyEmailScreen(),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
      case Routes.twoFactorAuthScreen:
        return MaterialPageRoute(
          builder: (_) => const TwoFactorAuthScreen(),
        );
      case Routes.enterOtpScreen:
        return MaterialPageRoute(
          builder: (_) => const EnterOtpScreen(),
        );
      case Routes.createProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const CreateProfileScreen(),
        );

      case Routes.addMidcalHistScreen:
        return MaterialPageRoute(
          builder: (_) => const AddMedicalHistoryScreen(),
        );
      case Routes.chronicDiseaseScreen:
        return MaterialPageRoute(
          builder: (_) => const ChronicDiseaseScreen(),
        );
      case Routes.mainLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => const HealixMainLayoutScreen(),
        );
      case Routes.resetPassScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPassScreen(),
        );
      case Routes.physcialInfoScreen:
        return MaterialPageRoute(
          builder: (_) => const PhysicalInfoScreen(),
        );
      case Routes.mainChatBotScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatBotScreen(),
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ChatCubit>(),
            child: const ChatScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
