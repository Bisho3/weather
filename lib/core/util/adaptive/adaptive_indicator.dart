

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/util/colors.dart';
import 'package:weather/weather/business_logic/home_logic/cubit.dart';
import 'package:weather/weather/business_logic/home_logic/states.dart';


class AdaptiveIndicator extends StatelessWidget {
  final String os;

  const AdaptiveIndicator({Key? key, required this.os}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (os == 'android') {
            return const RefreshProgressIndicator();
          } else {
            return  CupertinoActivityIndicator(
              color:  LogicCubit.get(context).isDark ? MyColors.greyColor :MyColors.whiteColor,
            );
          }
        });
  }
}
