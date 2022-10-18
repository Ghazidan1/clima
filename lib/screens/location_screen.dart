import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature;
  String? cityName;
  int? condition;
  WeatherModel weatherModel = WeatherModel();
  String? message;
  String? weatherIcon;
  void updateUI(dynamic weather) {
    setState(() {
      double temp = weather['main']['temp'];
      temperature = temp.toInt();
      cityName = weather['name'];
      condition = weather['weather'][0]['id'];
      message = weatherModel.getMessage(temperature!);
      weatherIcon = weatherModel.getWeatherIcon(condition!);
    });
  }

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/location_background.jpg'),
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //         Colors.white.withOpacity(0.8), BlendMode.dstATop),
        //   ),
        // ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherData =
                            await weatherModel.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: kActiveColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                        if (typedName != null) {
                          var weather =
                              await weatherModel.getCityWeather(typedName);
                          updateUI(weather);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: kActiveColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "$cityName",
                      style: kMessageTextStyle.copyWith(fontSize: 60.0),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 15.0),
                child: Text(
                  "$message !",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
              const SizedBox(
                height: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
