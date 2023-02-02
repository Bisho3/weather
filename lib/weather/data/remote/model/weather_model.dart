import 'package:weather/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      {required super.id,
      required super.cityName,
      required super.main,
      required super.description,
      required super.pressure,
      required super.temp,
      required super.tempMax,
      required super.tempMin,
      required super.humidity});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      id: json['id'],
      cityName: json['name'],
      main: json["weather"][0]["main"],
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'],
      temp: json['main']['temp'],
      tempMax: json['main']['temp_max'],
      tempMin: json['main']['temp_min'],
      humidity:json['main']['humidity'],
  );
}
