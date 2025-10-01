import 'package:bloc/bloc.dart';
import 'package:weather/models/forcast.dart';
import 'package:weather/screens/forecast/repository/forecast_repo.dart';
part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final ForecastRepo _forecastRepo;

  ForecastCubit(this._forecastRepo) : super(ForecastState());

  Future<void> fetchForecast(String city) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _forecastRepo.getForecast(city);

    result.fold(
          (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
          (forecast) {
        emit(state.copyWith(
          forecast: forecast,
          isLoading: false,
        ));
      },
    );
  }

  void selectDay(ListElement day) {
    emit(state.copyWith(selectedDay: day));
  }
}

