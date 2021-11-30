import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 80.sp,
          ),
          SizedBox(height: 3.h),
          Text(
            'Oops !',
            style: TakoTheme.darkTextTheme.headline1,
          ),
          SizedBox(height: 5.h),
          Text(
            'There is no internet connection',
            style: TakoTheme.darkTextTheme.subtitle2,
          ),
          SizedBox(height: 02.h),
          Text(
            'Please check your internet connection',
            style: TakoTheme.darkTextTheme.subtitle2,
          ),
          SizedBox(height: 05.h),
          MaterialButton(
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: tkLightGreen,
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
