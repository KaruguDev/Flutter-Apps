import 'package:clima/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/open_weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  //const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  // Extra Functions
  void getWeatherData() async {
    Weather weather = Weather();
    var weatherData = await weather.getWeather();
    var locationData = await weather.getCityName();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LandingScreen(
        weatherData: weatherData,
        locationData: locationData,
      );
    }));
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
