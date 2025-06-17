import 'package:get_it/get_it.dart';

import '../../features/appointment/domain/usecases/get_schedule_usecase.dart';
import '../../features/appointment/domain/usecases/book_appointment_usecase.dart';
import '../../features/appointment/presentation/logic/get_schedule_cubit/get_schedule_cubit.dart';
import '../../features/appointment/presentation/logic/book_appointment_cubit/book_appointment_cubit.dart';
import '../../features/chat_bot/data/datasources/chatbot_api_service.dart';
import '../../features/chat_bot/data/repositories_impl/chat_bot_repository_impl.dart';
import '../../features/chat_bot/domain/repositories/chat_bot_repository.dart';
import '../../features/chat_bot/domain/usecases/send_message_usecase.dart';
import '../../features/chat_bot/domain/usecases/get_all_chats_usecase.dart';
import '../../features/chat_bot/presentation/state_management/all_chats_cubit/all_chats_cubit.dart';
import '../../features/chat_bot/presentation/state_management/chat_cubit/chat_bot_cubit.dart';
import '../../features/family_group/data/datasources/family_group_api_service.dart';
import '../../features/family_group/data/repositories_impl/family_group_repository_impl.dart';
import '../../features/family_group/domain/repositories/family_group_repository.dart';
import '../../features/family_group/domain/usecases/create_family_group_usecase.dart';
import '../../features/family_group/domain/usecases/get_family_group_with_code_usecase.dart';
import '../../features/family_group/domain/usecases/join_family_group_usecase.dart';
import '../../features/family_group/domain/usecases/get_family_summary_usecase.dart';
import '../../features/family_group/presentation/logic/family_group_cubit/family_group_cubit.dart';
import '../../features/login/data/datasources/login_api_service.dart';
import '../../features/login/data/repositories_impl/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login_usecase.dart';
import '../../features/login/presentation/state_management/login_cubit.dart';
import '../../features/medical_history/domain/usecases/get_patient_summary_usecase.dart';
import '../../features/medical_history/presentation/logic/patient_summary_cubit/patient_summary_cubit.dart';
import '../../features/sign_up/data/datasources/sign_up_api_service.dart';
import '../../features/sign_up/data/repositories_impl/sign_up_repository_impl.dart';
import '../../features/sign_up/domain/repositories/sign_up_repository.dart';
import '../../features/sign_up/domain/usecases/sign_up_usecase.dart';
import '../../features/sign_up/domain/usecases/verify_email_usecase.dart';
import '../../features/sign_up/presentation/state_management/sign_up_cubit.dart';
import '../../features/medical_history/data/datasources/medical_history_api_service.dart';
import '../../features/medical_history/data/repositories_impl/medical_history_repository_impl.dart';
import '../../features/medical_history/domain/repositories/medical_history_repository.dart';
import '../../features/medical_history/domain/usecases/add_history_record_usecase.dart';
import '../../features/medical_history/domain/usecases/get_medical_records_by_type_usecase.dart';
import '../../features/medical_history/presentation/logic/medical_history_cubit/medical_history_cubit.dart';
import '../../features/medical_history/presentation/logic/get_medical_records_cubit/get_medical_records_cubit.dart';
import '../../features/main_layout/presentation/logic/navigation_cubit/navigation_cubit.dart';
import '../../features/appointment/data/datasources/appointment_api_service.dart';
import '../../features/appointment/data/repositories_impl/appointment_repository_impl.dart';
import '../../features/appointment/domain/repositories/appointment_repository.dart';
import '../../features/appointment/domain/usecases/get_doctors_usecase.dart';
import '../../features/appointment/presentation/logic/appointment_cubit/appointment_cubit.dart';
import '../networking/dio_factory.dart';
import '../domain/services/input_validation_service.dart';
import '../presentation/form/form_manager.dart';
import '../services/input_validation_service_impl.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Core Services
  getIt.registerLazySingleton<InputValidationService>(
    () => InputValidationServiceImpl(),
  );

  /// Dio
  final dio = DioFactory.getDio();

  /// ApiService
  getIt.registerLazySingleton<ChatbotApiService>(() => ChatbotApiService(dio));
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<SignUpApiService>(() => SignUpApiService(dio));
  getIt.registerLazySingleton<FamilyGroupApiService>(
      () => FamilyGroupApiService(dio));
  getIt.registerLazySingleton<MedicalHistoryApiService>(
      () => MedicalHistoryApiService(dio));
  getIt.registerLazySingleton<AppointmentApiService>(
      () => AppointmentApiService(dio));

  /// Repo
  getIt.registerLazySingleton<ChatBotRepository>(
      () => ChatBotRepositoryImpl(getIt()));
  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(getIt()));
  getIt.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(getIt()));
  getIt.registerLazySingleton<FamilyGroupRepository>(
      () => FamilyGroupRepositoryImpl(getIt()));
  getIt.registerLazySingleton<MedicalHistoryRepository>(
      () => MedicalHistoryRepositoryImpl(getIt()));
  getIt.registerLazySingleton<AppointmentRepository>(
      () => AppointmentRepositoryImpl(getIt()));

  /// UseCase
  getIt.registerLazySingleton(() => SendMessageUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAllChatsUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => SignUpUseCase(getIt()));
  getIt.registerLazySingleton(() => VerifyEmailUseCase(getIt()));
  getIt.registerLazySingleton(() => CreateFamilyGroupUseCase(getIt()));
  getIt.registerLazySingleton(() => JoinFamilyGroupUseCase(getIt()));
  getIt.registerLazySingleton(() => GetFamilyGroupWithCodeUseCase(getIt()));
  getIt.registerLazySingleton(() => GetFamilySummaryUseCase(getIt()));
  getIt.registerLazySingleton(() => AddHistoryRecordUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMedicalRecordsByTypeUseCase(getIt()));
  getIt.registerLazySingleton(() => GetDoctorsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetScheduleUseCase(getIt()));
  getIt.registerLazySingleton(() => BookAppointmentUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPatientSummaryUseCase(getIt()));

  /// Cubit
  getIt.registerFactory(() => ChatBotCubit(
        sendMessageUseCase: getIt(),
        validationService: getIt(),
        formManager: ChatFormManager(),
      ));
  getIt.registerFactory(() => AllChatsCubit(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt(), getIt(), LoginFormManager()));
  getIt.registerFactory(() => SignUpCubit(
        signUpUseCase: getIt(),
        verifyEmailUseCase: getIt(),
        validationService: getIt(),
        signUpFormManager: SignUpFormManager(),
        profileFormManager: CreateProfileFormManager(),
        physicalFormManager: PhysicalInfoFormManager(),
      ));
  getIt.registerFactory(
      () => FamilyGroupCubit(getIt(), getIt(), getIt(), getIt()));
  getIt.registerFactory(() => MedicalHistoryCubit(getIt()));
  getIt.registerFactory(() => GetMedicalRecordsCubit(getIt()));
  getIt.registerFactory(() => AppointmentCubit(getIt()));
  getIt.registerLazySingleton(() => NavigationCubit());
  getIt.registerFactory(() => GetScheduleCubit(getIt()));
  getIt.registerFactory(() => BookAppointmentCubit(getIt()));
  getIt.registerFactory(() => PatientSummaryCubit(getIt()));
}
