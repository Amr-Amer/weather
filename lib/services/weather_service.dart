import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/core/constants/app_constants.dart';

class WeatherService {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );



  Future<Map<String, dynamic>?> getCurrentWeather(String city) async {
    try {
      final response = await _dio.get(
        AppConstants.currentWeather,
        queryParameters: {
          "q": city,
          "appid": AppConstants.apiKey,
          "units": "metric",
          "lang": "en",
        },
      );
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print("❌ Dio Error (Current): ${e.message}");
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("❌ Error getCurrentWeather: $e");
      }
      return null;
    }
  }


  Future<Map<String, dynamic>?> getForecast(String city) async {
    try {
      final response = await _dio.get(
        AppConstants.forecastWeather,
        queryParameters: {
          "q": city,
          "appid": AppConstants.apiKey,
          "units": "metric",
          "lang": "ar",
        },
      );
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print("❌ Dio Error (Forecast): ${e.message}");
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("❌ Error getForecast: $e");
      }
      return null;
    }
  }
}
