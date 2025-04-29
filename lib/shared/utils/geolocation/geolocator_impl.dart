import 'package:geolocator/geolocator.dart';

import 'geolocator.dart';

class GetLocationImpl implements GetLocation {

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  @override
  Future<(double lat, double long)> getLocation() async {

    if( await handlePermission() ) {
      final position = await _geolocatorPlatform.getCurrentPosition();
      return (position.latitude, position.longitude);
    }

    return (0.0, 0.0);
  }

  Future<bool> handlePermission() async {
    
    LocationPermission permission;

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    return true;
  }
  
}