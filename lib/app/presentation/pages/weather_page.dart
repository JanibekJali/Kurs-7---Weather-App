import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/app/data/model/weather_model.dart';
import 'package:weather_app/app/data/repositories/geo_repo.dart';
import 'package:weather_app/app/data/repositories/weather_model_repo.dart';
import 'package:weather_app/app/data/services/geo_locator_service.dart';
import 'package:weather_app/app/data/services/weather_service.dart';

import '../../utils/constants/api.dart';
import '../../data/local_data/weather_util.dart';
import 'city_page.dart';

// refactoring, clean code
class WeatherPage extends StatefulWidget {
  const WeatherPage({
    Key key,
  }) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _cityName = '';
  String _celcius = '';
  String _description = '';
  String _icon = '';
  bool _isLoading = false;
  WeatherModel weatherModel;
  @override
  void initState() {
    showWeatherLocation();

    super.initState();
  }

  Future<void> showWeatherLocation() async {
    setState(() {
      _isLoading = true;
    });
    final position = await getLocation();
    await getCurrentWeather(position);
    setState(() {
      _isLoading = false;
    });
  }

  getLocation() {
    geoLocatorService.getLocation();
  }

  Future<void> getCurrentWeather(position) async {
    await weatherService1.getCurrentWeatherModel(position);
  }

  void getCityWeather(cityName) {
    weatherModelRepo.getCityNameWeatherModel(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: GestureDetector(
            onTap: () async {
              await showWeatherLocation();
              log('showWeatherLocation ==> ${showWeatherLocation()}');
            },
            child: Icon(
              Icons.navigation_rounded,
              size: 70.0,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CityPage(),
                  ),
                );
                getCityWeather(result);
                setState(() {});
              },
              icon: Icon(
                Icons.location_city,
                size: 70.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: _isLoading
            ? Center(
                child: const CircularProgressIndicator(),
              )
            : Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 150, right: 90),
                    child: Text(
                      "$_celcius \u00B0 $_icon",
                      style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 90),
                    child: Text(
                      _description,
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
                      _cityName,
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ) /* add child content here */,
      ),
    );
  }
}


// CRUD
// Create - post
// Read - get
// Update - put
//Delete - delete
