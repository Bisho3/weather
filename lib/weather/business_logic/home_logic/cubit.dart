import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/business_logic/home_logic/states.dart';
import 'package:weather/weather/data/local/sharedpreference.dart';
import 'package:weather/weather/data/remote/data_source/remote_datasource.dart';
import 'package:weather/weather/data/remote/repository/weather_repository.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';
import 'package:weather/weather/domain/usecases/get_weather_by_country.dart';

class LogicCubit extends Cubit<LogicStates> {
  LogicCubit() : super(LogicInitialStates());

  static LogicCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? isDarkBeNull}) {
    if (isDarkBeNull != null) {
      isDark = isDarkBeNull;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  Weather? weather;
  Future<void> getCurrentWeatherByName({
  required String cityName,
})async{
    emit(GetWeatherLoading());
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseWeatherRepository baseWeatherRepository = WeatherRepository(baseRemoteDataSource);
     weather = await GetWeatherByCountryName(baseWeatherRepository).execute(cityName);
     emit(GetWeatherSuccess());
  }
}
