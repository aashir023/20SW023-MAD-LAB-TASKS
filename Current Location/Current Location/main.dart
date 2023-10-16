import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Position? _currentPosition;
  String _currentAddress = "";

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enable Location Service")));

      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Location Permission Denied")));

        return false;
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Permission Denied! Go to your app settings")));

        return false;
      }
      // return true;
    }

    return true;
  }

  Future<void> _getCurrentLocation() async {
    final bool hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _currentPosition = position;
      });

      getAddressFromCoordinates(position);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getAddressFromCoordinates(Position position) async {
    try {
      final List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      final place = placemark[0];
      setState(() {
        _currentAddress =
            "${place.street}, ${place.locality}, ${place.country}}";
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('LAT: ${_currentPosition?.latitude ?? ""}'),
            SizedBox(
              height: 30,
            ),
            Text('LNG: ${_currentPosition?.longitude ?? ""}'),
            SizedBox(
              height: 30,
            ),
            Text('ADDRESS: ${_currentAddress ?? ""}'),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: _getCurrentLocation, child: Text("Click"))
          ],
        ),
      ),
    ));
  }
}
