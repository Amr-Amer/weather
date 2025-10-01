import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/services/storage_service.dart';

class CitiesCubit extends Cubit<List<String>> {
  CitiesCubit() : super([]);

  Future<void> loadCities() async {
    final cities = await FavoriteCityService.getFavoriteCities();
    emit(cities);
  }

  Future<void> addCity(String city) async {
    await FavoriteCityService.addFavoriteCity(city);
    await loadCities();
    if (kDebugMode) {
      print("$city Added to favorites");
    }
  }

  Future<void> removeCity(String cityName) async {
    await FavoriteCityService.removeFavoriteCity(cityName);
    await loadCities();
  }

  Future<void> clearCities() async {
    await FavoriteCityService.clearFavoriteCities();
    emit([]);
  }

  Future<void> removeAllCities() async {
    await FavoriteCityService.clearFavoriteCities();
    emit([]);
  }
}
