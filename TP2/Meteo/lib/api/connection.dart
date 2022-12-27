import 'dart:convert';
import 'package:http/http.dart';
import '../models/m_foreCast.dart';
import '../models/m_location.dart';
import '../models/m_weather.dart';

// Classe qui encapsule les appels réseau
class Network {
  static String lang = "fr";
  static String units = "metric";
  static String appid = "60a157096d1ea34e43592b7be7ed30c3";

  static Future getForecast(Location location) async {
    String lat = location.lat;
    String lon = location.lon;
    var finalUrl = "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$appid&units=$units&lang=$lang";

    final response = await get(Uri.parse(finalUrl));
    print("F3 URL : ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("F3 weather data: ${response.body}}");
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("F3 Error getting {lat:$lat;lon:$lon} weather forecast");
    }
  }

  static Future getCurrentWeather(Location location) async {
    String cityName = location.city;
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appid&units=$units&lang=$lang";
    print("F2 URL : ${Uri.encodeFull(finalUrl)}");

    final response = await get(Uri.parse(finalUrl));

    if (response.statusCode == 200) {
      print("F2 weather data: ${response.body}}");
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("F2 Error getting $cityName weather forecast");
    }
  }


}
