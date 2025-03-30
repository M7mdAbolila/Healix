import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  // ignore: unused_local_variable
  Dio dio = DioFactory.getDio();

  ///
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // getIt.registerLazySingleton<Repo>(() => Repo(getIt()));
  // getIt.registerFactory<Cubit>(() => Cubit(getIt()));
}
