import 'm_daily.dart';
class Forecast { // prévision

  final List<Daily> daily;

  Forecast({required this.daily});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> dailyData = json['daily'];

    List<Daily> daily = [];

    dailyData.forEach((item) {
      var day = Daily.fromJson(item);
      daily.add(day);
    });

    return Forecast(daily: daily);
  }
}

