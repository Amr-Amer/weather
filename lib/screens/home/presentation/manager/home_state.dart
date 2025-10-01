import 'package:weather/models/weather_model.dart';
import 'package:weather/models/city_model.dart';

class HomeState {
  final CityModel? selectedCity;
  final WeatherModel? currentWeather;
  final bool isLoading;
  final String? errorMessage;

  HomeState({
    this.selectedCity,
    this.currentWeather,
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    CityModel? selectedCity,
    WeatherModel? currentWeather,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      selectedCity: selectedCity ?? this.selectedCity,
      currentWeather: currentWeather ?? this.currentWeather,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
