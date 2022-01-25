import 'package:geolocator/geolocator.dart';
import 'package:clima/utilities/custom_widgets.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getLocation() async {
    try {
      LocationPermission checkPermission = await Geolocator.checkPermission();
      if (checkPermission == LocationPermission.denied) {
        LocationPermission requestPermission =
            await Geolocator.requestPermission();
        if (requestPermission == LocationPermission.denied) {
          await Geolocator.requestPermission();
        }
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      ClimaAlert();
      //throw Exception(e);
    }
  }
}
