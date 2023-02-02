import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/util/bloc_observer.dart';
import 'package:weather/core/util/theme/theme.dart';
import 'package:weather/weather/business_logic/home_logic/cubit.dart';
import 'package:weather/weather/business_logic/home_logic/states.dart';
import 'package:weather/weather/data/local/sharedpreference.dart';
import 'package:weather/weather/data/remote/data_source/remote_datasource.dart';
import 'package:weather/weather/data/remote/repository/weather_repository.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';
import 'package:weather/weather/domain/usecases/get_weather_by_country.dart';
import 'package:weather/weather/presentation/screens/no_internet_screen.dart';
import 'package:weather/weather/presentation/screens/weather_home.dart';

import 'weather/domain/entities/weather.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp( MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key,required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
            LogicCubit()..changeAppMode(isDarkBeNull: isDark)),
      ],
      child: BlocConsumer<LogicCubit, LogicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(

                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: LogicCubit.get(context).isDark
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  home: child,
                );
              },
              child: OfflineBuilder(
                connectivityBuilder: (
                    BuildContext context,
                    ConnectivityResult connectivity,
                    Widget child,
                    ) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  if (connected) {
                    return  WeatherHomeScreen();
                  } else {
                    return const NoInternetScreen();
                  }
                },
                child: const SizedBox(),
              ));
        },
      ),
    );
  }
}
