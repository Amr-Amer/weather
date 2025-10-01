
import 'package:get_it/get_it.dart';
import 'package:weather/screens/cities/presentation/manager/cities_cubit.dart';
import 'package:weather/screens/forecast/presentation/manager/forecast_cubit.dart';
import 'package:weather/screens/forecast/repository/forecast_repo.dart';
import 'package:weather/screens/home/presentation/manager/home_cubit.dart';
import 'package:weather/screens/home/repository/home_repo.dart';
import 'package:weather/services/weather_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //TODO: Network Service

  sl.registerLazySingleton(() => WeatherService());

  //TODO: Repository
  sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl()));
  sl.registerLazySingleton<ForecastRepo>(() => ForecastRepoImp(sl()));


  sl.registerLazySingleton(() =>
      HomeCubit(sl(),));

  sl.registerLazySingleton(() =>
      ForecastCubit(sl(),));

  sl.registerLazySingleton(() =>
      CitiesCubit());
}