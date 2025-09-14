
import '../Models/weather_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherServices {
  final String apikey = '86edf32920d63716d8c786bb33b3cfcb';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}
