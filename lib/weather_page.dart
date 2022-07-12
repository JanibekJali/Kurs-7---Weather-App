import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'pages/city_page.dart';
import 'package:http/http.dart' as http;

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
  @override
  void initState() {
    showWeatherLocation();
    super.initState();
  }

  Future<void> showWeatherLocation() async {
    final position = await getLocation();
    await getCurrentWeather();
    // log('position latitude ===> ${position.latitude}');
    // log('position longitude ===> ${position.longitude}');
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getCurrentWeather() async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=40.548555635&lon=72.7996271139&appid=c3aa0301d9353c81b3f8e8254ca12e23');
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        // log('response ==>$body');
        final _data = jsonDecode(body);
        _cityName = _data['name'];
        // final tepm = _data['main']['temp'] ;
        // _celcius = tepm - 273.15.round();

        // log('cityName ===> $cityName');
        // log('tepm ==> $tepm');
        // log(' celcius ==> $celcius');
        setState(() {});
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Icon(
            Icons.navigation_rounded,
            size: 70.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CityPage())),
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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 150, right: 90),
              child: Text(
                "$_celcius \u00B0 ⛅️",
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 90),
              child: Text(
                "Sen jiluu kiyin 👘",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
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
