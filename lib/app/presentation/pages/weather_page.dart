import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app/data/model/weather_model.dart';
import 'package:weather_app/app/data/repositories/geo_repo.dart';
import 'package:weather_app/app/data/repositories/weather_model_repo.dart';
import 'package:weather_app/app/presentation/widgets/custom_bg_img.dart';
import 'package:weather_app/app/presentation/widgets/custom_content_widget.dart';
import 'package:weather_app/app/presentation/widgets/custom_loading_indicator.dart';
import 'city_page.dart';

GetIt getIt = GetIt.instance;

// refactoring, clean code
class WeatherPage extends StatefulWidget {
  const WeatherPage({
    Key key,
  }) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool _isLoading = false;
  WeatherModel weatherModel;

  @override
  void initState() {
    showWeatherLocation();

    super.initState();
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
          padding: const EdgeInsets.only(left: 25.0),
          child: GestureDetector(
            onTap: () async {
              await showWeatherLocation();
              log('showWeatherLocation ==> ${showWeatherLocation()}');
            },
            child: const Icon(
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
              icon: const Icon(
                Icons.location_city,
                size: 70.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: CustomBgImg(
          child: _isLoading
              ? const Center(
                  child: CustomLoadingIndicator(
                    isLoading: false,
                  ),
                )
              : CustomContentWidget(
                  celcius: weatherModel.celcius,
                  cityName: weatherModel.cityName,
                  description: weatherModel.description,
                  icon: weatherModel.icon,
                )),
    );
  }

  Future<void> showWeatherLocation() async {
    setState(() {
      _isLoading = true;
    });
    final position = await getIt<GeoRepo>().getLocation();
    weatherModel =
        await getIt<WeatherModelRepo>().getCurrentWeatherModel(position);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getCityWeather(cityName) async {
    setState(() {
      _isLoading = true;
    });
    weatherModel =
        await getIt<WeatherModelRepo>().getCityNameWeatherModel(cityName);
    setState(() {
      _isLoading = false;
    });
  }
}


// CRUD
// Create - post
// Read - get
// Update - put
//Delete - delete
