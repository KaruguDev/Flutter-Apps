import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/custom_widgets.dart';
import 'package:clima/services/open_weather.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({this.weatherData, this.locationData});
  final weatherData;
  final locationData;

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Weather weather = Weather();
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
          forecastWeatherTemp.add(el['feels_like']['day'].toInt());
          forecastWeather.add(el['weather'][0]['main']);
          weatherIcons.add(el['weather'][0]['icon']);
          var forecastWeatherDay =
              Jiffy.unixFromSecondsSinceEpoch(el['dt']).format();
          forecastWeatherDay = forecastWeatherDay.split('T')[0];
          forecastWeatherDays.add(forecastWeatherDay);
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                icon: Icon(Icons.near_me, size: 50),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 10),
                onPressed: () {
                  var weatherData = weather.getWeather();
                  var locationData = weather.getCityName();

                  LandingScreen(
                    weatherData: weatherData,
                    locationData: locationData,
                  );
                },
              ),
              ClimaDivider(),
              Expanded(
                flex: 1,
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
                      style: kCurrentWeatherTextStyle,
                    ),
                    Text(
                      '$currentWeather',
                      style: kCurrentWeatherDescTextStyle,
                    ),
                  ],
                ),
              ),
              ClimaDivider(),
              Text(
                'Forecast',
                style: kForecastWeatherDescTextStyle,
              ),
              ClimaDivider(),
              // Text(
              //   '${Jiffy('2022-01-28').from('2022-01-25')}',
              //   style: kForecastWeatherTextStyle,
              // ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: weatherIcons.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${Jiffy(forecastWeatherDays[index]).from(currentWeatherDay) == 'in a day' ? 'tomorrow' : Jiffy(forecastWeatherDays[index]).from(currentWeatherDay)}',
                              style: kForecastWeatherTextStyle,
                            ),
                            Image.network(
                                'http://openweathermap.org/img/wn/${weatherIcons[index]}@2x.png'),
                            Text(
                              '${forecastWeatherTemp[index]} \u2103',
                              style: kForecastWeatherTextStyle,
                            ),
                            Text(
                              '${forecastWeather[index]}',
                              style: kForecastWeatherDescTextStyle,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              ClimaDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
