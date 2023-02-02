import 'dart:convert';

import 'package:weather/core/util/constances.dart';
import 'package:dio/dio.dart';
import 'package:weather/weather/data/remote/model/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCountryName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(String cityName) async {
    try {
      var response = await Dio().get(
          '${AppConstance.baseUrl}/weather?q=$cityName&appid=${AppConstance.appKey}');
      print("Bishoo ${response.data}");
      return WeatherModel.fromJson(response.data);

    } catch (e) {
      print(e);
      return null;
    }
  }
}
