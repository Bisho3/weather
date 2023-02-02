import 'package:weather/weather/data/remote/data_source/remote_datasource.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository{
final BaseRemoteDataSource remoteDataSource;

  WeatherRepository(this.remoteDataSource);
  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
   return  (await remoteDataSource.getWeatherByCountryName(cityName))!;
  }

}