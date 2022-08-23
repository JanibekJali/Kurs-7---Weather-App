import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/services/weather_service.dart';

import '../model/weather_model.dart';

class WeatherModelRepo {
  Future<WeatherModel> getCurrentWeatherModel(Position currentPosition) async {
    return await weatherService1.getCurrentWeatherModel(currentPosition);
  }

  Future<WeatherModel> getCityNameWeatherModel(String cityName) async {
    return await weatherService1.getCityNameWeatherModel(cityName);
  }
}

final WeatherModelRepo weatherModelRepo = WeatherModelRepo();
