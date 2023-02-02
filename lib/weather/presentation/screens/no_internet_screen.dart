import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/core/util/adaptive/adaptive_indicator.dart';
import 'package:weather/core/util/colors.dart';
import 'package:weather/core/util/constances.dart';
import 'package:weather/core/util/strings.dart';

import 'package:weather/core/util/images.dart';
import 'package:weather/weather/presentation/shared_widget/custom_material_button.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(MyImages.disConnectInternet, height: 300.h),
            SizedBox(
              height: 1.h,
            ),
            Text(
              MyStrings.noInternet,
              style: TextStyle(
                color: MyColors.foreignColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              MyStrings.noInternetStatus,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1.h,
            ),
            CustomMaterialButton(
              function: () {
                Center(child: AdaptiveIndicator(
                  os: getOs(),
                ));
              },
              text: MyStrings.tryAgain,
              radius: 10.r,
              width: 180.w,
              fontSize: 22.sp,
              background: MyColors.whiteColor,
              textColor: MyColors.foreignColor,
              borderRadius: MyColors.foreignColor,
            ),
          ],
        ),
      ),
    );
  }
}
