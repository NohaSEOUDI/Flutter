import 'package:flutter/material.dart';
import 'package:meteo/views/myHomePage.dart';

import 'models/m_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Location> locations = [
      Location(city: "Montpellier", country: "France", lat: "43.6109", lon: "3.8772")
    ];

    return MaterialApp(
        title: 'Weather Forecast',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: CurrentWeatherPage(locations, context));
  }
}


