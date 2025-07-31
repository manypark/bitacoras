import 'geolocator.dart';
import 'package:geolocator/geolocator.dart';

import 'package:bitacoras/shared/plugins/plugins.dart';

class GetLocationImpl implements GetLocation {

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  @override
  Future<(double lat, double long)> getLocation() async {

    if( await PermissionsHandler.hasCurrentLocationPermission() ) {
      final position = await _geolocatorPlatform.getCurrentPosition();
      return (position.latitude, position.longitude);
    }

    return (0.0, 0.0);
  }
  
}