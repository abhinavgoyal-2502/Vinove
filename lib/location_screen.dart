import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'location_service.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController _mapController;
  LocationData? _currentLocation;
  LocationService _locationService = LocationService();
  
  Set<Marker> _markers = {};
  List<LatLng> _routeCoordinates = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Fetch the current location
  Future<void> _getCurrentLocation() async {
    LocationData? locationData = await _locationService.getLocation();
    setState(() {
      _currentLocation = locationData;
    });

    if (locationData != null) {
      _mapController.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(locationData.latitude!, locationData.longitude!), 15.0,
        ),
      );

      // Add marker for current location
      _markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(locationData.latitude!, locationData.longitude!),
          infoWindow: InfoWindow(title: "Current Location"),
        ),
      );

      // Add the location to the route list
      _routeCoordinates.add(LatLng(locationData.latitude!, locationData.longitude!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location & Route Tracker')),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                zoom: 15.0,
              ),
              markers: _markers,
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: _routeCoordinates,
                  color: Colors.blue,
                  width: 5,
                ),
              },
            ),
    );
  }
}
