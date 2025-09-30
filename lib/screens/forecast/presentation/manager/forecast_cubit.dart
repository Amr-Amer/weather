import 'package:bloc/bloc.dart';
part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit() : super(ForecastInitial());

  Future<void> loadForecast() async {
    emit(ForecastLoading());

    await Future.delayed(const Duration(seconds: 1));

    final dummyData = [
      ForecastDay(day: "Mon", iconUrl: "https://openweathermap.org/img/wn/10d.png", temp: 22),
      ForecastDay(day: "Tue", iconUrl: "https://openweathermap.org/img/wn/01d.png", temp: 24),
      ForecastDay(day: "Wed", iconUrl: "https://openweathermap.org/img/wn/04d.png", temp: 20),
      ForecastDay(day: "Thu", iconUrl: "https://openweathermap.org/img/wn/09d.png", temp: 19),
      ForecastDay(day: "Fri", iconUrl: "https://openweathermap.org/img/wn/02d.png", temp: 23),
    ];

    emit(ForecastLoaded(days: dummyData ));
  }

  void selectDay(ForecastDay day) {
    if (state is ForecastLoaded) {
      final current = state as ForecastLoaded;
      emit(ForecastLoaded(days: current.days, selectedDay: day));
    }
  }
}
