import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/services/geo_locator_service.dart';

class GeoRepo {
  Future<Position> getLocation() async {
    return await geoLocatorService.getLocation();
  }
}

final GeoRepo geoRepo = GeoRepo();
