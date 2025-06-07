import 'package:get_it/get_it.dart';

import '../../features/chat_bot/data/datasources/chat_api_service.dart';
import '../../features/chat_bot/data/repositories/chat_repo_impl.dart';
import '../../features/chat_bot/domain/repositories/chat_repo.dart';
import '../../features/chat_bot/domain/usecases/send_message_use_case.dart';
import '../../features/chat_bot/presentation/logic/chat_cubit/chat_cubit.dart';
import '../../features/login/data/datasources/login_api_service.dart';
import '../../features/login/data/repositories_impl/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login_usecase.dart';
import '../../features/login/presentation/logic/login_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio
  getIt.registerLazySingleton(() => DioFactory.getDio());

  // ApiService
  getIt.registerLazySingleton<ChatApiService>(() => ChatApiService(getIt()));
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(getIt()));

  // Repo
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepoImpl(getIt()));
  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(getIt()));

  // UseCase
  getIt.registerLazySingleton(() => SendMessageUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  // Cubit
  getIt.registerFactory(() => ChatCubit(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
}
