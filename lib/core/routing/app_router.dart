import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healix/core/di/setup_get_it.dart';
import 'package:healix/features/appointment/presentation/state_management/get_schedule_cubit/get_schedule_cubit.dart';
import 'package:healix/features/appointment/presentation/screens/choose_specialty_screen.dart';
import 'package:healix/features/appointment/presentation/screens/doctor_details_screen.dart';
import 'package:healix/features/appointment/presentation/screens/doctors_list_screen.dart';
import 'package:healix/features/chat_bot/presentation/screens/chat_bot_screen.dart';
import 'package:healix/features/chat_bot/presentation/screens/all_chats_screen.dart';
import 'package:healix/features/forget_password/presentation/screens/enter_otp_screen.dart';
import 'package:healix/features/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:healix/features/forget_password/presentation/screens/reset_pass_screen.dart';
import 'package:healix/features/login/presentation/state_management/login_cubit.dart';
import 'package:healix/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/add_allergy_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/add_chronic_disease_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/add_hereditary_disease_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/add_lab_test_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/add_logs_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/add_medical_visit_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/add_surgery_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/add_x_ray_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/all_medical_records_screen.dart';
import 'package:healix/features/medical_history/presentation/screens/medical_categories_screen.dart';
import 'package:healix/features/onboarding/presentation/onboarding_screen.dart';
import 'package:healix/features/sign_up/presentation/screens/physical_info_screen.dart';
import 'package:healix/features/sign_up/presentation/screens/sign_up_screen.dart';

import '../../features/appointment/domain/entities/get_doctors_response_entity.dart';
import '../../features/chat_bot/presentation/state_management/chat_cubit/chat_bot_cubit.dart';
import '../../features/family_group/family_group.dart';
import '../../features/login/presentation/screens/login_screen.dart';
import '../../features/sign_up/presentation/screens/create_profile_screen.dart';
import '../../features/forget_password/presentation/screens/two_factor_auth_screen.dart';
import '../../features/sign_up/presentation/state_management/sign_up_cubit.dart';
import '../../features/verify_email/presentation/screens/verify_email_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
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
          builder: (_) => const AllChatsScreen(),
        );
      case Routes.medicalCategoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const MedicalCategoriesScreen(),
        );
      case Routes.viewAllMedicalRecordsScreen:
        final args = settings.arguments;
        final index = args as int;
        return MaterialPageRoute(
          builder: (_) => AllMedicalRecordsScreen(selectedIndex: index),
        );
      case Routes.addMedicalVistScreen:
        return MaterialPageRoute(
          builder: (_) => const AddMedicalVisitScreen(),
        );
      case Routes.addLabTestScreen:
        return MaterialPageRoute(
          builder: (_) => const AddLabTestScreen(),
        );
      case Routes.addXRayScreen:
        return MaterialPageRoute(
          builder: (_) => const AddXRayScreen(),
        );
      case Routes.addSurgeryScreen:
        return MaterialPageRoute(
          builder: (_) => const AddSurgeryScreen(),
        );
      case Routes.addLogsScreen:
        return MaterialPageRoute(
          builder: (_) => const AddLogsScreen(),
        );
      case Routes.addChronicDiseaseScreen:
        return MaterialPageRoute(
          builder: (_) => const AddChronicDiseaseScreen(),
        );
      case Routes.addHereditaryDiseaseScreen:
        return MaterialPageRoute(
          builder: (_) => const AddHereditaryDiseaseScreen(),
        );
      case Routes.addAllergyScreen:
        return MaterialPageRoute(
          builder: (_) => const AddAllergyScreen(),
        );
      case Routes.chooseSpecialtyScreen:
        return MaterialPageRoute(
          builder: (_) => const ChooseSpecialtyScreen(),
        );
      case Routes.doctorsListScreen:
        final args = settings.arguments;
        final specialtyIndex = args as int;
        return MaterialPageRoute(
          builder: (_) => DoctorsListScreen(
            specialtyIndex: specialtyIndex,
          ),
        );
      case Routes.doctorDetailsScreen:
        final args = settings.arguments;
        final doctor = args is DoctorEntity ? args : null;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<GetScheduleCubit>(),
            child: DoctorDetailsScreen(doctor: doctor),
          ),
        );
      case Routes.myFamilyScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<GetFamilyGroupCubit>(),
            child: const MyFamilyScreen(),
          ),
        );
      case Routes.familyGroupMembersScreen:
        final args = settings.arguments;
        final familyGroup = args is FamilyGroupModel ? args : null;
        return MaterialPageRoute(
          builder: (_) => FamilyGroupMembersScreen(familyGroup: familyGroup),
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ChatBotCubit>(),
            child: ChatBotScreen(arguments: settings.arguments),
          ),
        );
      default:
        return null;
    }
  }
}
