import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/city_background.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: kActiveColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    cityName = value;
                  },
                  style: TextStyle(color: kMainTextColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(color: kLightTextColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: kInactiveColor.withAlpha(100),
                      borderRadius: BorderRadius.circular(15.0)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle.copyWith(color: kActiveColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
