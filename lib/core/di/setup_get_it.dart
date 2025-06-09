import 'package:get_it/get_it.dart';

import '../../features/chat_bot/data/datasources/chatbot_api_service.dart';
import '../../features/chat_bot/data/repositories/chatbot_repo_impl.dart';
import '../../features/chat_bot/domain/repositories/chat_repo.dart';
import '../../features/chat_bot/domain/usecases/send_message_use_case.dart';
import '../../features/chat_bot/presentation/logic/chat_cubit/chat_cubit.dart';
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
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio
  getIt.registerLazySingleton(() => DioFactory.getDio());
  // ApiService
  getIt.registerLazySingleton<ChatbotApiService>(
      () => ChatbotApiService(getIt()));
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(getIt()));
  getIt
      .registerLazySingleton<SignUpApiService>(() => SignUpApiService(getIt()));

  // Repo
  getIt.registerLazySingleton<ChatRepo>(() => ChatbotRepoImpl(getIt()));
  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(getIt()));
  getIt.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(getIt()));

  // UseCase
  getIt.registerLazySingleton(() => SendMessageUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => SignUpUseCase(getIt()));
  getIt.registerLazySingleton(() => VerifyEmailUseCase(getIt()));

  // Cubit
  getIt.registerFactory(() => ChatCubit(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
  getIt.registerFactory(() => SignUpCubit(getIt(), getIt()));
}
