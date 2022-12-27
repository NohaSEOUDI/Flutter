import 'package:meteo/cubit/repo_weather.dart';
import 'package:meteo/cubit/state_weather.dart';
import 'package:bloc/bloc.dart';
import '../models/m_weather.dart';
import 'event_weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherInitial());

  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoading();

      try {
        Weather weather = await weatherRepo.getWeather(event.city);
        yield WeatherIsLoaded(weather);
      } catch (_) {
        yield WeatherIsNotLoaded();
      }
    } else if (event is ResetWeather){
      yield WeatherIsNotSearched();
    }
  }
}

