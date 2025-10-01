import 'package:bloc/bloc.dart';
import 'package:weather/models/forecast_model.dart';
import 'package:weather/screens/forecast/repository/forecast_repo.dart';
part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final ForecastRepo _forecastRepo;

  ForecastCubit(this._forecastRepo) : super(ForecastState());

  Future<void> fetchForecast(String city) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _forecastRepo.getForecast(city);

    if (isClosed) return;

    result.fold(
          (failure) {
        if (isClosed) return;
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
          (forecast) {
        if (isClosed) return;
        final dailyForecast = getDailyForecast(forecast.list);

        final filteredForecast = ForecastModel(
          city: forecast.city,
          cod: forecast.cod,
          message: forecast.message,
          cnt: dailyForecast.length,
          list: dailyForecast,
        );

        emit(state.copyWith(
          forecast: filteredForecast,
          isLoading: false,
        ));
      },
    );
  }



  List<ListElement> getDailyForecast(List<ListElement> list) {
    final Map<int, ListElement> dailyMap = {};

    for (var element in list) {
      final day = element.dtTxt.day;
      if (!dailyMap.containsKey(day)) {
        dailyMap[day] = element;
      }
    }

    return dailyMap.values.toList();
  }


  void selectDay(ListElement day) {
    emit(state.copyWith(selectedDay: day));
  }
}

