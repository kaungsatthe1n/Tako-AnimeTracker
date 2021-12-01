import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tako/screens/main_screen.dart';
import 'package:tako/util/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateMainScreen();
  }

  @override
  void dispose() {
    super.dispose();
  }

  navigateMainScreen() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: tkDarkerBlue),
            width: 100.w,
            height: 80.h,
            child: Image.asset(
              'assets/images/logo-nobackground.png',
              width: 50.w,
            ),
          ),
          Container(
            width: 40.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: const LinearProgressIndicator(
              backgroundColor: Colors.grey,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
