import 'package:get_it/get_it.dart';

import '../../features/chat_bot/data/datasources/chatbot_api_service.dart';
import '../../features/chat_bot/data/repositories/chatbot_repo_impl.dart';
import '../../features/chat_bot/domain/repositories/chat_repo.dart';
import '../../features/chat_bot/domain/usecases/send_message_use_case.dart';
import '../../features/chat_bot/domain/usecases/get_all_chats_use_case.dart';
import '../../features/chat_bot/presentation/logic/chat_cubit/chat_cubit.dart';
import '../../features/chat_bot/presentation/logic/all_chats_cubit/all_chats_cubit.dart';
import '../../features/family_group/data/datasources/family_group_api_service.dart';
import '../../features/family_group/data/repositories_impl/family_group_repository_impl.dart';
import '../../features/family_group/domain/repositories/family_group_repository.dart';
import '../../features/family_group/domain/usecases/create_family_group_usecase.dart';
import '../../features/family_group/domain/usecases/get_family_group_with_code_usecase.dart';
import '../../features/family_group/domain/usecases/join_family_group_usecase.dart';
import '../../features/family_group/presentation/logic/family_group_cubit/family_group_cubit.dart';
import '../../features/login/data/datasources/login_api_service.dart';
import '../../features/login/data/repositories_impl/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login_usecase.dart';
import '../../features/login/presentation/logic/login_cubit.dart';
import '../../features/sign_up/data/datasources/sign_up_api_service.dart';
import '../../features/sign_up/data/repositories_impl/sign_up_repository_impl.dart';
import '../../features/sign_up/domain/repositories/sign_up_repository.dart';
import '../../features/sign_up/domain/usecases/sign_up_usecase.dart';
import '../../features/sign_up/domain/usecases/verify_email_usecase.dart';
import '../../features/sign_up/presentation/logic/sign_up_cubit/sign_up_cubit.dart';
import '../../features/medical_history/data/datasources/medical_history_api_service.dart';
import '../../features/medical_history/data/repositories_impl/medical_history_repository_impl.dart';
import '../../features/medical_history/domain/repositories/medical_history_repository.dart';
import '../../features/medical_history/domain/usecases/add_history_record_usecase.dart';
import '../../features/medical_history/domain/usecases/get_medical_records_by_type_usecase.dart';
import '../../features/medical_history/presentation/logic/medical_history_cubit/medical_history_cubit.dart';
import '../../features/medical_history/presentation/logic/get_medical_records_cubit/get_medical_records_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio
  final dio = DioFactory.getDio();
  // ApiService
  getIt.registerLazySingleton<ChatbotApiService>(() => ChatbotApiService(dio));
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<SignUpApiService>(() => SignUpApiService(dio));
  getIt.registerLazySingleton<FamilyGroupApiService>(
      () => FamilyGroupApiService(dio));
  getIt.registerLazySingleton<MedicalHistoryApiService>(
      () => MedicalHistoryApiService(dio));

  // Repo
  getIt.registerLazySingleton<ChatRepo>(() => ChatbotRepoImpl(getIt()));
  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(getIt()));
  getIt.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(getIt()));
  getIt.registerLazySingleton<FamilyGroupRepository>(
      () => FamilyGroupRepositoryImpl(getIt()));
  getIt.registerLazySingleton<MedicalHistoryRepository>(
      () => MedicalHistoryRepositoryImpl(getIt()));
  // UseCase
  getIt.registerLazySingleton(() => SendMessageUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAllChatsUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => SignUpUseCase(getIt()));
  getIt.registerLazySingleton(() => VerifyEmailUseCase(getIt()));
  getIt.registerLazySingleton(() => CreateFamilyGroupUseCase(getIt()));
  getIt.registerLazySingleton(() => JoinFamilyGroupUseCase(getIt()));
  getIt.registerLazySingleton(() => GetFamilyGroupWithCodeUseCase(getIt()));
  getIt.registerLazySingleton(() => AddHistoryRecordUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMedicalRecordsByTypeUseCase(getIt()));

  // Cubit
  getIt.registerFactory(() => ChatCubit(getIt()));
  getIt.registerFactory(() => AllChatsCubit(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
  getIt.registerFactory(() => SignUpCubit(getIt(), getIt()));
  getIt.registerFactory(() => FamilyGroupCubit(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => MedicalHistoryCubit(getIt()));
  getIt.registerFactory(() => GetMedicalRecordsCubit(getIt()));
}
