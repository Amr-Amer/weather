import 'package:weather/models/weather_model.dart';

class HomeState {
  final String? selectedCountry;
  final WeatherModel? currentWeather;
  final bool isLoading;
  final String? errorMessage;

  HomeState({
    this.selectedCountry,
    this.currentWeather,
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    String? selectedCountry,
    WeatherModel? currentWeather,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      currentWeather: currentWeather ?? this.currentWeather,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
