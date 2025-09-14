import 'package:flutter/material.dart';
import 'package:my_weather_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme:ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: HomeScreen(),
    );

  }
}