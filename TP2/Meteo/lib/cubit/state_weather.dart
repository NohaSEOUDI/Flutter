import 'package:equatable/equatable.dart';

import '../models/m_weather.dart';

class WeatherState extends Equatable {
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherIsLoaded extends WeatherState {
  final _weather;

  WeatherIsLoaded(this._weather);

  Weather get getWeather => _weather;

  @override
  List<Object> get props => [_weather];
}
class WeatherIsNotSearched extends WeatherState {}
class WeatherIsLoading extends WeatherState {}
class WeatherIsNotLoaded extends WeatherState {}

