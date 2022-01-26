import 'package:clima/services/request_http.dart';
import 'package:clima/config/config.dart';

class Weather {
  Weather({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
  final String apiKey = Config.apiKey;

  Future<dynamic> getWeather() async {
    var openWeatherURL = 'https://api.openweathermap.org/data/2.5/onecall';
    Uri getWeatherUrl = Uri.parse(
        '$openWeatherURL?lat=$latitude&lon=$longitude&units=metric&exclude=minutely,hourly&appid=$apiKey');

    RequestHTTP requesthttp = RequestHTTP(getWeatherUrl);
    var weatherData = await requesthttp.getData();

    return weatherData;
  }

  Future<dynamic> getCityName() async {
    var openWeatherURL = 'http://api.openweathermap.org/geo/1.0/reverse';

    Uri getLocationUrl = Uri.parse(
        '$openWeatherURL?lat=$latitude&lon=$longitude&limit=5&appid=$apiKey');

    RequestHTTP requestlochttp = RequestHTTP(getLocationUrl);
    var locationData = await requestlochttp.getData();

    return locationData;
  }
}
