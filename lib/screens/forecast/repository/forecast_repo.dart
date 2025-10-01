import 'package:weather/core/constants/app_strings.dart';
import 'package:weather/models/forecast_model.dart';
import 'package:weather/services/failure.dart';
import 'package:weather/services/weather_service.dart';
import 'package:dartz/dartz.dart';

abstract class ForecastRepo {
  Future<Either<Failure, ForecastModel>> getForecast(String city);
}

class ForecastRepoImp implements ForecastRepo {
  final WeatherService _weatherService;

  ForecastRepoImp(this._weatherService);

  @override
  Future<Either<Failure, ForecastModel>> getForecast(String city) async {
    try {
      final result = await _weatherService.getForecast(city);

      if (result == null || result["list"] == null) {
        return Left(Failure(message: AppStrings.noDataAvailable));
      }

      final forecast = ForecastModel.fromJson(result);
      return Right(forecast);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

