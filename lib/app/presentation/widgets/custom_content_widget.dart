import 'package:flutter/material.dart';
import 'package:weather_app/app/data/model/weather_model.dart';

class CustomContentWidget extends StatelessWidget {
  final String celcius;
  final String icon;
  final String description;
  final String cityName;

  CustomContentWidget({
    this.celcius,
    this.icon,
    this.description,
    this.cityName,
    Key key,
  }) : super(key: key);
  WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 150, right: 90),
          child: Text(
            "$celcius \u00B0 $icon",
            style: TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 90),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.1, left: 40),
          child: Text(
            cityName,
            style: TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
