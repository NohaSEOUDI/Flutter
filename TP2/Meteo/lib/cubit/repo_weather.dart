import 'dart:convert';
import 'package:http/http.dart';
import '../models/m_location.dart';
import '../models/m_weather.dart';

class WeatherRepo {
  static String lang = "fr";
  static String units = "metric";
  static String appid = "60a157096d1ea34e43592b7be7ed30c3";

  Future<Weather> getWeather(Location location) async {
    String cityName = location.city;
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appid&units=$units&lang=$lang";
    print("Repo URL : ${Uri.encodeFull(finalUrl)}");

    var response = await Client().get(Uri.parse(finalUrl));

    if (response.statusCode != 200) {
      print("Repo weather data: ${response.body}}");
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }

  }
}
