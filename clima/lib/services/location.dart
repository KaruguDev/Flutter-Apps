import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position> getLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
      }
      LocationPermission checkPermission = await Geolocator.checkPermission();
      if (checkPermission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
      Position? position = await Geolocator.getLastKnownPosition();
      if (position == null) {
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low,
            timeLimit: const Duration(seconds: 10));
      }

      return position;
    } catch (e) {
      //print(e);
      throw Exception(e);
    }
  }
}
