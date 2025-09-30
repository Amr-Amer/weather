import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class HomeRepo {

  final WeatherService _weatherService;

  HomeRepo(this._weatherService);

  Future<WeatherModel?> getCurrentWeather(String city) async {
    final result = await _weatherService.getCurrentWeather(city);
    if (result != null) {
      return WeatherModel.fromJson(result);
    }
    return null;
  }

}