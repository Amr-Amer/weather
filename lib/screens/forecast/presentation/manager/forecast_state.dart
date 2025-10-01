part of 'forecast_cubit.dart';

class ForecastState {
  final bool isLoading;
  final String? errorMessage;
  final ForecastModel? forecast;
  final ListElement? selectedDay;

  ForecastState({
    this.isLoading = false,
    this.errorMessage,
    this.forecast,
    this.selectedDay,
  });

  ForecastState copyWith({
    bool? isLoading,
    String? errorMessage,
    ForecastModel? forecast,
    ListElement? selectedDay,
  }) {
    return ForecastState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      forecast: forecast ?? this.forecast,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}

