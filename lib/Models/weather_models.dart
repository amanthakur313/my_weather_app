class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      // temperature: json['main']['temp'].toDouble()- 273.15, // ✅ sahi key
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'],        // ✅ array ke 0 index se
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}
