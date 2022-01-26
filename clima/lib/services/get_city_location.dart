import 'package:clima/services/request_http.dart';
import 'package:clima/config/config.dart';

class City {
  City({required this.city});
  final String city;
  final String apiKey = Config.apiKey;
  Map position = {};

  Future<Map> getLocation() async {
    var openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
    var url = Uri.parse('$openWeatherURL?q=$city&appid=$apiKey');

    RequestHTTP requesthttp = RequestHTTP(url);
    var apiData = await requesthttp.getData();

    if (apiData != null) {
      position = {
        'latitude': apiData['coord']['lat'],
        'longitude': apiData['coord']['lon'],
      };
    }

    return position;
  }
}
