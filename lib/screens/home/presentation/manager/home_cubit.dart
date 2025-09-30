import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/home/presentation/manager/home_state.dart';
import 'package:weather/screens/home/repository/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeState());

  void selectCountry(String country) {
    emit(state.copyWith(selectedCountry: country));
    fetchCurrentWeather(country);
  }

  Future<void> fetchCurrentWeather(String city) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final weather = await _homeRepo.getCurrentWeather(city);
      if (weather != null) {
        emit(state.copyWith(
          currentWeather: weather,
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: "Failed to fetch weather",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  String formatDate(int? timestamp) {
    if (timestamp == null) return "";
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return "${date.day.toString().padLeft(2,'0')}/"
        "${date.month.toString().padLeft(2,'0')}/"
        "${date.year}";
  }


}
