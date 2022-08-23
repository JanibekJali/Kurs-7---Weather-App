import 'package:weather_app/app/data/local_data/weather_util.dart';

class WeatherModel {
  final String cityName;
  final String celcius;
  final String description;
  final String icon;
  WeatherModel({
    this.cityName,
    this.celcius,
    this.description,
    this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final kelvin = json['main']['temp'] as num;

    return WeatherModel(
      celcius: WeatherUtil.calculateWeather(kelvin),
      cityName: json['name'],
      description: WeatherUtil.getDescription(
        int.parse(
          WeatherUtil.calculateWeather(kelvin),
        ),
      ),
      icon: WeatherUtil.getWeatherIcon(kelvin),
    );
  }
}
