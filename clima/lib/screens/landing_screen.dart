import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/custom_widgets.dart';
import 'package:clima/utilities/custom_dialogs.dart';
import 'package:clima/services/open_weather.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/get_city_location.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({this.weatherData, this.locationData});
  final weatherData;
  final locationData;

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List weatherIcons = [];
  List forecastWeather = [];
  List forecastWeatherDays = [];
  List forecastWeatherTemp = [];
  int? currentTemp;
  String? cityName;
  String? currentWeather;
  var currentWeatherDay;
  String? currentWeatherIcon;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData, widget.locationData);
  }

  void updateUI(dynamic weatherData, dynamic locationData) {
    setState(() {
      weatherIcons.clear();
      forecastWeather.clear();
      forecastWeatherDays.clear();
      forecastWeatherTemp.clear();
      cityName = locationData[0]['name'];
      currentTemp = weatherData['current']['feels_like'].toInt();
      currentWeather = weatherData['current']['weather'][0]['description'];
      currentWeatherDay = weatherData['current']['dt'];
      currentWeatherDay =
          Jiffy.unixFromSecondsSinceEpoch(currentWeatherDay).format();
      currentWeatherDay = currentWeatherDay.split('T')[0];
      currentWeatherIcon = weatherData['current']['weather'][0]['icon'];
      List dailyList = weatherData['daily'];
      dailyList.asMap().forEach((idx, el) {
        if (idx > 0) {
          var forecastWeatherDay =
              Jiffy.unixFromSecondsSinceEpoch(el['dt']).format();
          forecastWeatherDay = forecastWeatherDay.split('T')[0];
          DateTime currDay = DateTime.parse(currentWeatherDay);
          DateTime forecastDay = DateTime.parse(forecastWeatherDay);
          if (forecastDay.compareTo(currDay) > 0) {
            forecastWeatherTemp.add(el['feels_like']['day'].toInt());
            forecastWeather.add(el['weather'][0]['main']);
            weatherIcons.add(el['weather'][0]['icon']);
            forecastWeatherDays.add(forecastWeatherDay);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  TextButton(
                    child: Icon(
                      Icons.near_me,
                      size: 40,
                      color: Colors.white,
                    ),
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                    onPressed: () async {
                      Location loc = Location();
                      var coord = await loc.getLocation();
                      Weather weather = Weather(
                        latitude: coord.latitude,
                        longitude: coord.longitude,
                      );
                      var weatherData = await weather.getWeather();
                      var locationData = await weather.getCityName();

                      updateUI(weatherData, locationData);
                    },
                  ),
                  Spacer(flex: 4),
                  TextButton(
                    child: Icon(
                      Icons.location_city,
                      size: 40,
                      color: Colors.white,
                    ),
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LocationPopupScreen();
                        }),
                      );
                      if (typedName != null) {
                        City city = City(city: typedName);
                        var coord = await city.getLocation();
                        if (coord.isNotEmpty) {
                          Weather weather = Weather(
                            latitude: coord['latitude'].toDouble(),
                            longitude: coord['longitude'].toDouble(),
                          );
                          var weatherData = await weather.getWeather();
                          var locationData = await weather.getCityName();

                          updateUI(weatherData, locationData);
                        }
                      }
                    },
                  ),
                ],
              ),
              ClimaDivider(),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$cityName',
                      style: kTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Image.network(
                        'http://openweathermap.org/img/wn/$currentWeatherIcon@2x.png'),
                    Text(
                      '$currentTemp \u2103',
                      style: kTextStyle25,
                    ),
                    Text(
                      '$currentWeather',
                      style: kTextStyle20,
                    ),
                  ],
                ),
              ),
              ClimaDivider(),
              Text(
                'Forecast',
                style: kTextStyle20,
              ),
              ClimaDivider(),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  width: double.maxFinite,
                  child: ListView.separated(
                      //shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherIcons.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          //mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${Jiffy(forecastWeatherDays[index]).from(currentWeatherDay) == 'in a day' ? 'tomorrow' : Jiffy(forecastWeatherDays[index]).from(currentWeatherDay)}',
                              style: kTextStyle15,
                            ),
                            Image.network(
                                'http://openweathermap.org/img/wn/${weatherIcons[index]}@2x.png'),
                            Text(
                              '${forecastWeatherTemp[index]} \u2103',
                              style: kTextStyle15,
                            ),
                            Text(
                              '${forecastWeather[index]}',
                              style: kTextStyle20,
                            ),
                          ],
                        );
                      }),
                ),
              ),
              ClimaDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
