class CityModel {
  final String name;
  final String country;
  final double lat;
  final double lon;

  CityModel({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'],
      country: json['country'],
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'lat': lat,
      'lon': lon,
    };
  }
}


class Cities {
  static List<CityModel> allCities = [
    // Egypt
    CityModel(name: "Cairo", country: "EG", lat: 30.0444, lon: 31.2357),
    CityModel(name: "Alexandria", country: "EG", lat: 31.2001, lon: 29.9187),
    CityModel(name: "Giza", country: "EG", lat: 30.0131, lon: 31.2089),

    // UAE
    CityModel(name: "Dubai", country: "AE", lat: 25.276987, lon: 55.296249),
    CityModel(name: "Abu Dhabi", country: "AE", lat: 24.4539, lon: 54.3773),

    // Lebanon
    CityModel(name: "Beirut", country: "LB", lat: 33.8938, lon: 35.5018),

    // Saudi Arabia
    CityModel(name: "Riyadh", country: "SA", lat: 24.7136, lon: 46.6753),
    CityModel(name: "Jeddah", country: "SA", lat: 21.4858, lon: 39.1925),

    // Jordan
    CityModel(name: "Amman", country: "JO", lat: 31.9539, lon: 35.9106),

    // Kuwait
    CityModel(name: "Kuwait City", country: "KW", lat: 29.3759, lon: 47.9774),

    // World
    CityModel(name: "London", country: "GB", lat: 51.5074, lon: -0.1278),
    CityModel(name: "Paris", country: "FR", lat: 48.8566, lon: 2.3522),
    CityModel(name: "New York", country: "US", lat: 40.7128, lon: -74.0060),
    CityModel(name: "Tokyo", country: "JP", lat: 35.6762, lon: 139.6503),
    CityModel(name: "Sydney", country: "AU", lat: -33.8688, lon: 151.2093),
  ];
}

