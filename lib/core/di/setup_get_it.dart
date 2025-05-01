import 'package:get_it/get_it.dart';

import '../../features/chat_bot/data/datasources/chat_api_service.dart';
import '../../features/chat_bot/data/repositories/chat_repo_impl.dart';
import '../../features/chat_bot/domain/repositories/chat_repo.dart';
import '../../features/chat_bot/domain/usecases/send_message_use_case.dart';
import '../../features/chat_bot/presentation/logic/chat_cubit/chat_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio
  getIt.registerLazySingleton(() => DioFactory.getDio());

  // ApiService
  getIt.registerLazySingleton<ChatApiService>(() => ChatApiService(getIt()));

  // Repo
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepoImpl(getIt()));

  // UseCase
  getIt.registerLazySingleton(() => SendMessageUseCase(getIt()));

  // Cubit
  getIt.registerFactory(() => ChatCubit(getIt()));
}
