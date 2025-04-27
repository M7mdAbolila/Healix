import 'package:get_it/get_it.dart';

import '../../features/chat_bot/data/datasources/chat_api_service.dart';
import '../../features/chat_bot/data/repositories_impl/chat_repo_impl.dart';
import '../../features/chat_bot/domain/repositories/chat_repo.dart';
import '../../features/chat_bot/domain/use_cases/send_message_usecase.dart';
import '../../features/chat_bot/presentation/logic/chat_cubit.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton(() => DioFactory.getDio());

  // ApiService
  sl.registerLazySingleton<ChatApiService>(() => ChatApiService(sl()));

  // Repo
  sl.registerLazySingleton<ChatRepo>(() => ChatRepoImpl(sl()));

  // UseCase
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));

  // Cubit
  sl.registerFactory(() => ChatCubit(sl()));
}
