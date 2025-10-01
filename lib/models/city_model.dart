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
    CityModel(name: "Tokyo", country: "JP", lat: 35.6762, lon: 139.6503),
    CityModel(name: "Cairo", country: "EG", lat: 30.0444, lon: 31.2357),
    CityModel(name: "New York", country: "US", lat: 40.7128, lon: -74.0060),
    CityModel(name: "Rio de Janeiro", country: "BR", lat: -22.9068, lon: -43.1729),
    CityModel(name: "Sydney", country: "AU", lat: -33.8688, lon: 151.2093),
    CityModel(name: "Paris", country: "FR", lat: 48.8566, lon: 2.3522),
    CityModel(name: "Dubai", country: "AE", lat: 25.276987, lon: 55.296249),
    CityModel(name: "Moscow", country: "RU", lat: 55.7558, lon: 37.6173),
    CityModel(name: "Beijing", country: "CN", lat: 39.9042, lon: 116.4074),
    CityModel(name: "Berlin", country: "DE", lat: 52.52, lon: 13.405),
    CityModel(name: "Buenos Aires", country: "AR", lat: -34.6037, lon: -58.3816),
    CityModel(name: "Istanbul", country: "TR", lat: 41.0082, lon: 28.9784),
    CityModel(name: "Lagos", country: "NG", lat: 6.5244, lon: 3.3792),
    CityModel(name: "Toronto", country: "CA", lat: 43.6532, lon: -79.3832),
    CityModel(name: "Bangkok", country: "TH", lat: 13.7563, lon: 100.5018),
    CityModel(name: "Johannesburg", country: "ZA", lat: -26.2041, lon: 28.0473),
    CityModel(name: "London", country: "GB", lat: 51.5074, lon: -0.1278),
    CityModel(name: "Lima", country: "PE", lat: -12.0464, lon: -77.0428),
    CityModel(name: "Seoul", country: "KR", lat: 37.5665, lon: 126.9780),
    CityModel(name: "Rome", country: "IT", lat: 41.9028, lon: 12.4964),
  ];
}

