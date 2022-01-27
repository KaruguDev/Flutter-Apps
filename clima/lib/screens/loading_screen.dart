import 'package:clima/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/open_weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/util_functions.dart';
import 'package:clima/utilities/custom_dialogs.dart';

class LoadingScreen extends StatefulWidget {
  //const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  // Extra Functions
  void getData() async {
    Location loc = Location();
    var coord = await loc.getLocation();
    Weather weather = Weather(
      latitude: coord.latitude,
      longitude: coord.longitude,
    );
    var weatherData = await weather.getWeather();
    var locationData = await weather.getCityName();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LandingScreen(
          weatherData: weatherData,
          locationData: locationData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SpinKitDoubleBounce(
      color: Colors.white,
      size: 100,
    ));
  }
}
