import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_ease/core/logger.dart';
import 'package:shop_ease/features/auth/auth.dart';

GetIt locator = GetIt.instance;

// class Sl {
//   static setup() async {
//     final prefs = await SharedPreferences.getInstance();
//     final authLocalDS = AuthLocalDataSource();
//     final authRemoteDS = AuthRemoteDataSource();

//     locator.registerLazySingleton<Logger>(() => ConsoleLogger());
//     locator.registerSingleton<SharedPreferences>(prefs);
//     locator.registerSingleton<NetworkService>(NetworkService());
//     // locator.registerLazySingleton<AuthRepository>(
//     //   () => AuthRepositoryImpl(localDS: locator(), remoteDS: locator()),
//     // );
//     locator.registerLazySingleton<AuthRepository>(
//         () => AuthRepositoryImpl(localDS: authLocalDS, remoteDS: authRemoteDS));

//     await locator<NetworkService>().testReq();
//   }
// }

void setUpLocator() async {
  final prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<Logger>(() => ConsoleLogger());
  locator.registerSingleton<SharedPreferences>(prefs);
  // locator.registerSingleton<NetworkService>(NetworkService());
  // locator.registerLazySingleton<NetworkService>(() => NetworkService());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        localDS: locator(),
        remoteDS: locator(),
      ));
  // _locator.registerSingleton<CacheHelper>(CacheHelper.init());
  // _locator.registerSingleton<Logger>(FileLogger());
  // _locator.registerLazySingleton<CacheHelper>(() => CacheHelper.init());
  // await locator<NetworkService>().testReq();
}
