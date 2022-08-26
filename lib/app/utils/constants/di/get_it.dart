import 'dart:developer';

import 'package:weather_app/app/data/services/weather_service.dart';
import 'package:weather_app/app/utils/http/app_http.dart';

import '../../../data/repositories/geo_repo.dart';
import '../../../data/repositories/weather_model_repo.dart';
import '../../../data/services/geo_locator_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  services();
  repository();
  http();
}

void services() {
  log('services.......');
  getIt.registerSingleton<GeoLocatorService>(GeoLocatorService());
  getIt.registerSingleton<WeatherService>(WeatherService());
}

void repository() {
  log('repository.......');
  getIt.registerSingleton<GeoRepo>(GeoRepo());
  getIt.registerSingleton<WeatherModelRepo>(WeatherModelRepo());
}

void http() {
  getIt.registerSingleton<AppHttp>(AppHttp());
}
