import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather/core/util/adaptive/adaptive_indicator.dart';
import 'package:weather/core/util/colors.dart';
import 'package:weather/core/util/constances.dart';
import 'package:weather/core/util/images.dart';
import 'package:weather/core/util/strings.dart';
import 'package:weather/weather/business_logic/home_logic/cubit.dart';
import 'package:weather/weather/business_logic/home_logic/states.dart';
import 'package:weather/weather/presentation/screens/result_weather.dart';
import 'package:weather/weather/presentation/shared_widget/custom_form_field.dart';
import 'package:weather/weather/presentation/shared_widget/custom_material_button.dart';

class WeatherHomeScreen extends StatelessWidget {
  final TextEditingController cityNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  WeatherHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicStates>(
      listener: (context, state) {
        if(state is GetWeatherSuccess){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ResultWeather()));
        }
      },
      builder: (context, state) {
        LogicCubit cubit = LogicCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  cubit.changeAppMode();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        MyImages.weatherApp,
                        height: 250.h,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomFormField(
                        controller: cityNameController,
                        text: MyStrings.cityName,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return MyStrings.emptyCityName;
                          }
                          return null;
                        },
                        onTap: () {},
                        radius: 10,
                        preffixIcon: Icons.sunny_snowing,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      ConditionalBuilder(
                        condition: state is! GetWeatherLoading ,
                        builder: (context){
                          return  CustomMaterialButton(
                            function: () {
                              if(formKey.currentState!.validate()){
                                cubit.getCurrentWeatherByName(cityName: cityNameController.text);
                              }
                            },
                            text: MyStrings.search,
                            radius: 10.r,
                            fontSize: 20.sp,
                            textColor: cubit.isDark
                                ? MyColors.primaryColor
                                : MyColors.whiteColor,
                            background: cubit.isDark
                                ? MyColors.whiteColor
                                : HexColor('333739'),
                            borderRadius: MyColors.foreignColor,
                            width: 250.w,
                          );
                        },
                        fallback:(context)=> Center(child: AdaptiveIndicator(
                          os: getOs(),
                        )) ,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
