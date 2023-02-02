import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/core/util/colors.dart';
import 'package:weather/core/util/images.dart';
import 'package:weather/core/util/strings.dart';
import 'package:weather/weather/business_logic/home_logic/cubit.dart';
import 'package:weather/weather/business_logic/home_logic/states.dart';
import 'package:weather/weather/presentation/shared_widget/custom_get_result_weather.dart';

class ResultWeather extends StatelessWidget {
  const ResultWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LogicCubit cubit = LogicCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      MyImages.resultWeather,
                      height: 250.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.foreignColor),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(10.h),
                        child: Column(
                          children: [
                            CustomResultGetWeather(
                              askText: MyStrings.name,
                              answerText: cubit.weather!.cityName,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomResultGetWeather(
                              askText: MyStrings.main,
                              answerText: cubit.weather!.main,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomResultGetWeather(
                              askText: MyStrings.description,
                              answerText: cubit.weather!.description,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomResultGetWeather(
                              askText: MyStrings.pressure,
                              answerText: "${cubit.weather!.pressure}",
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomResultGetWeather(
                              askText: MyStrings.temp,
                              answerText: "${cubit.weather!.temp}",
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomResultGetWeather(
                              askText: MyStrings.tempMax,
                              answerText: "${cubit.weather!.tempMax}",
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomResultGetWeather(
                              askText: MyStrings.tempMin,
                              answerText: "${cubit.weather!.tempMin}",
                            ),    SizedBox(
                              height: 15.h,
                            ),
                            CustomResultGetWeather(
                              askText: MyStrings.humidity,
                              answerText: "${cubit.weather!.humidity}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
