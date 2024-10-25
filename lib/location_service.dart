import 'package:location/location.dart';

class LocationService {
  Location _location = Location();
  
  Future<LocationData?> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if the location service is enabled
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    // Check if location permission is granted
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    // Get the current location
    return await _location.getLocation();
  }
}
