import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/model/weather_model.dart';
import 'package:weather_app/app/utils/constants/di/get_it.dart';
import 'package:weather_app/app/utils/constants/texts/app_texts.dart';
import 'package:weather_app/app/utils/http/app_http.dart';

GetIt getIt = GetIt.instance;

class WeatherService {
  Future<Map<String, dynamic>> getCurrentWeather(
      Position currentPosition) async {
    final _url =
        '${AppTexts.baseUrl}?lat=${currentPosition.latitude}35&lon=${currentPosition.longitude}139&appid=${AppTexts.api}';

    return await getIt<AppHttp>().get(_url);
  }

  Future<Map<String, dynamic>> getCityWeather(String cityName) async {
    final _url = '${AppTexts.baseUrl}?q=$cityName&appid=${AppTexts.api}';
    return await getIt<AppHttp>().get(_url);
  }

  Future<WeatherModel> getCurrentWeatherModel(Position currentPosition) async {
    final data = await getCurrentWeather(currentPosition);
    WeatherModel weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }

  Future<WeatherModel> getCityNameWeatherModel(String cityName) async {
    final data = await getCityWeather(cityName);
    WeatherModel weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }
}
