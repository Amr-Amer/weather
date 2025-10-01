//
// import 'dart:convert';
// import 'package:weather/models/weather_model.dart';
//
// ForecastModel forecastModelFromJson(String str) => ForecastModel.fromJson(json.decode(str));
//
// String forecastModelToJson(ForecastModel data) => json.encode(data.toJson());
//
// class ForecastModel {
//     ForecastModel({
//         required this.city,
//         required this.cnt,
//         required this.cod,
//         required this.message,
//         required this.list,
//     });
//
//     City city;
//     int cnt;
//     String cod;
//     int message;
//     List<ListElement> list;
//
//     factory ForecastModel.fromJson(Map<dynamic, dynamic> json) => ForecastModel(
//         city: City.fromJson(json["city"]),
//         cnt: json["cnt"],
//         cod: json["cod"],
//         message: json["message"],
//         list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
//     );
//
//     Map<dynamic, dynamic> toJson() => {
//         "city": city.toJson(),
//         "cnt": cnt,
//         "cod": cod,
//         "message": message,
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//     };
// }
//
// class City {
//     City({
//         required this.country,
//         required this.coord,
//         required this.sunrise,
//         required this.timezone,
//         required this.sunset,
//         required this.name,
//         required this.id,
//         required this.population,
//     });
//
//     String country;
//     Coord coord;
//     int sunrise;
//     int timezone;
//     int sunset;
//     String name;
//     int id;
//     int population;
//
//     factory City.fromJson(Map<dynamic, dynamic> json) => City(
//         country: json["country"],
//         coord: Coord.fromJson(json["coord"]),
//         sunrise: json["sunrise"],
//         timezone: json["timezone"],
//         sunset: json["sunset"],
//         name: json["name"],
//         id: json["id"],
//         population: json["population"],
//     );
//
//     Map<dynamic, dynamic> toJson() => {
//         "country": country,
//         "coord": coord.toJson(),
//         "sunrise": sunrise,
//         "timezone": timezone,
//         "sunset": sunset,
//         "name": name,
//         "id": id,
//         "population": population,
//     };
// }
//
// class ListElement {
//     ListElement({
//         required this.dt,
//         required this.pop,
//         required this.visibility,
//         required this.dtTxt,
//         required this.weather,
//         required this.main,
//         required this.clouds,
//         required this.sys,
//         required this.wind,
//     });
//
//     int dt;
//     int pop;
//     int visibility;
//     DateTime dtTxt;
//     List<Weather> weather;
//     MainClass main;
//     Clouds clouds;
//     Sys sys;
//     Wind wind;
//
//     factory ListElement.fromJson(Map<dynamic, dynamic> json) => ListElement(
//         dt: json["dt"],
//         pop: json["pop"],
//         visibility: json["visibility"],
//         dtTxt: DateTime.parse(json["dt_txt"]),
//         weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
//         main: MainClass.fromJson(json["main"]),
//         clouds: Clouds.fromJson(json["clouds"]),
//         sys: Sys.fromJson(json["sys"]),
//         wind: Wind.fromJson(json["wind"]),
//     );
//
//     Map<dynamic, dynamic> toJson() => {
//         "dt": dt,
//         "pop": pop,
//         "visibility": visibility,
//         "dt_txt": dtTxt.toIso8601String(),
//         "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
//         "main": main.toJson(),
//         "clouds": clouds.toJson(),
//         "sys": sys.toJson(),
//         "wind": wind.toJson(),
//     };
// }
//
//
// class MainClass {
//     MainClass({
//         required this.temp,
//         required this.tempMin,
//         required this.grndLevel,
//         required this.tempKf,
//         required this.humidity,
//         required this.pressure,
//         required this.seaLevel,
//         required this.feelsLike,
//         required this.tempMax,
//     });
//
//     double temp;
//     double tempMin;
//     int grndLevel;
//     double tempKf;
//     int humidity;
//     int pressure;
//     int seaLevel;
//     double feelsLike;
//     double tempMax;
//
//     factory MainClass.fromJson(Map<dynamic, dynamic> json) => MainClass(
//         temp: json["temp"]?.toDouble(),
//         tempMin: json["temp_min"]?.toDouble(),
//         grndLevel: json["grnd_level"],
//         tempKf: json["temp_kf"]?.toDouble(),
//         humidity: json["humidity"],
//         pressure: json["pressure"],
//         seaLevel: json["sea_level"],
//         feelsLike: json["feels_like"]?.toDouble(),
//         tempMax: json["temp_max"]?.toDouble(),
//     );
//
//     Map<dynamic, dynamic> toJson() => {
//         "temp": temp,
//         "temp_min": tempMin,
//         "grnd_level": grndLevel,
//         "temp_kf": tempKf,
//         "humidity": humidity,
//         "pressure": pressure,
//         "sea_level": seaLevel,
//         "feels_like": feelsLike,
//         "temp_max": tempMax,
//     };
// }
//
// enum Pod { D, N }
//
// final podValues = EnumValues({
//     "d": Pod.D,
//     "n": Pod.N
// });
//
// enum Description { CLEAR_SKY, SCATTERED_CLOUDS }
//
// final descriptionValues = EnumValues({
//     "clear sky": Description.CLEAR_SKY,
//     "scattered clouds": Description.SCATTERED_CLOUDS
// });
//
// enum Icon { THE_01_D, THE_01_N, THE_03_N }
//
// final iconValues = EnumValues({
//     "01d": Icon.THE_01_D,
//     "01n": Icon.THE_01_N,
//     "03n": Icon.THE_03_N
// });
//
// enum MainEnum { CLEAR, CLOUDS }
//
// final mainEnumValues = EnumValues({
//     "Clear": MainEnum.CLEAR,
//     "Clouds": MainEnum.CLOUDS
// });
//
// class Wind {
//     Wind({
//         required this.deg,
//         required this.speed,
//         required this.gust,
//     });
//
//     int deg;
//     double speed;
//     double gust;
//
//     factory Wind.fromJson(Map<dynamic, dynamic> json) => Wind(
//         deg: json["deg"],
//         speed: json["speed"]?.toDouble(),
//         gust: json["gust"]?.toDouble(),
//     );
//
//     Map<dynamic, dynamic> toJson() => {
//         "deg": deg,
//         "speed": speed,
//         "gust": gust,
//     };
// }
//
// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;
//
//     EnumValues(this.map);
//
//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
