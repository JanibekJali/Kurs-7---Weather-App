import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app/data/services/weather_service.dart';
import 'package:weather_app/app/utils/constants/di/get_it.dart';

import '../model/weather_model.dart';

GetIt getIt = GetIt.instance;

class WeatherModelRepo {
  Future<WeatherModel> getCurrentWeatherModel(Position currentPosition) async {
    return await getIt<WeatherService>()
        .getCurrentWeatherModel(currentPosition);
  }

  Future<WeatherModel> getCityNameWeatherModel(String cityName) async {
    return await getIt<WeatherService>().getCityNameWeatherModel(cityName);
  }
}
