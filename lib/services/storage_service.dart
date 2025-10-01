import 'package:shared_preferences/shared_preferences.dart';

class FavoriteCityService {
  static const String _keyFavoriteCities = "favorite_cities";

  static Future<void> addFavoriteCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    final cities = prefs.getStringList(_keyFavoriteCities) ?? [];

    if (!cities.contains(city)) {
      cities.add(city);
      await prefs.setStringList(_keyFavoriteCities, cities);
    }
  }

  static Future<List<String>> getFavoriteCities() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyFavoriteCities) ?? [];
  }

  static Future<void> removeFavoriteCity(String cityName) async {
    final prefs = await SharedPreferences.getInstance();
    final cities = prefs.getStringList(_keyFavoriteCities) ?? [];
    cities.remove(cityName);
    await prefs.setStringList(_keyFavoriteCities, cities);
  }

  static Future<void> clearFavoriteCities() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyFavoriteCities);
  }
}
