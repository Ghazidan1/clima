import 'package:clima/screens/loading_screen.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              color: kAppBarColor,
              titleTextStyle: TextStyle(color: kBoldTextColor))),
      home: LoadingScreen(),
    );
  }
}
