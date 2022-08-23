import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/model/weather_model.dart';

import '../../utils/constants/api.dart';

class WeatherService {
  Future<Map<String, dynamic>> getCurrentWeather(
      Position currentPosition) async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${currentPosition.latitude}35&lon=${currentPosition.longitude}139&appid=$api');
      // response jon gana joop
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        return jsonDecode(body) as Map<String, dynamic>;

        // _cityName = _data['name'];
        // final kelvin = _data['main']['temp'] as num;

        // _celcius = WeatherUtil.calculateWeather(kelvin);
        // _description = WeatherUtil.getDescription(int.parse(_celcius));
        // _icon = WeatherUtil.getWeatherIcon(kelvin);

      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getCityWeather(String cityName) async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$api');
      final joop = await client.get(uri);
      if (joop.statusCode == 200 || joop.statusCode == 201) {
        final _data = jsonDecode(joop.body) as Map<String, dynamic>;
        return _data;
        // _cityName = _data['name'];
        // final kelvin = _data['main']['temp'] as num;

        // _celcius = WeatherUtil.calculateWeather(kelvin);
        // _description = WeatherUtil.getDescription(int.parse(_celcius));
        // _icon = WeatherUtil.getWeatherIcon(kelvin);

      } else {
        return null;
      }
    } catch (katany) {
      throw Exception(katany);
    }
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

final WeatherService weatherService1 = WeatherService();
