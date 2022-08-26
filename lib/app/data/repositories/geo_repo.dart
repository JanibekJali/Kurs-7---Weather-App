import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app/data/services/geo_locator_service.dart';

GetIt getIt = GetIt.instance;

class GeoRepo {
  Future<Position> getLocation() async {
    return await getIt<GeoLocatorService>().getLocation();
  }
}
