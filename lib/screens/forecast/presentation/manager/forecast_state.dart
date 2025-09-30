part of 'forecast_cubit.dart';

sealed class ForecastState {}

final class ForecastInitial extends ForecastState {}

final class ForecastLoading extends ForecastState {}

final class ForecastLoaded extends ForecastState {
  final List<ForecastDay> days;
  final ForecastDay? selectedDay;

  ForecastLoaded({required this.days, this.selectedDay});
}
final class ForecastError extends ForecastState {
  final String message;
  ForecastError(this.message);
}

class ForecastDay {
  final String day;
  final String iconUrl;
  final int temp;

  ForecastDay({
    required this.day,
    required this.iconUrl,
    required this.temp,
  });
}
