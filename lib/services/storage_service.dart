import 'package:weather/models/city_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavoriteCityService {
  static const String _keyFavoriteCity = "favorite_city";

  //TODO: Save favorite city
  static Future<void> saveFavoriteCity(CityModel city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyFavoriteCity, city.name);
  }

  //TODO: Get favorite city
  static Future<String?> getFavoriteCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyFavoriteCity);
  }

  //TODO: Remove favorite city
  static Future<void> removeFavoriteCity() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_keyFavoriteCity);
  }
}
