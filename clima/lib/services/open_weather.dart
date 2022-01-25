import 'package:clima/services/request_http.dart';
import 'package:clima/services/location.dart';
import 'package:clima/config/config.dart';

class Weather {
  final String apiKey = Config.apiKey;
  Location loc = Location();

  Future<dynamic> getWeather() async {
    await loc.getLocation();
    var openWeatherURL = 'https://api.openweathermap.org/data/2.5/onecall';
    Uri getWeatherUrl = Uri.parse(
        '$openWeatherURL?lat=${loc.latitude}&lon=${loc.longitude}&units=metric&exclude=minutely,hourly&appid=$apiKey');

    RequestHTTP requesthttp = RequestHTTP(getWeatherUrl);
    var weatherData = await requesthttp.getData();

    return weatherData;
  }

  Future<dynamic> getCityName() async {
    await loc.getLocation();
    var openWeatherURL = 'http://api.openweathermap.org/geo/1.0/reverse';

    Uri getLocationUrl = Uri.parse(
        '$openWeatherURL?lat=${loc.latitude}&lon=${loc.longitude}&limit=5&appid=$apiKey');

    RequestHTTP requestlochttp = RequestHTTP(getLocationUrl);
    var locationData = await requestlochttp.getData();

    return locationData;
  }
}
