import 'package:flutter/material.dart';
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
    navigateToMainScreen();
  }

  @override
  void dispose() {
    super.dispose();
  }

  navigateToMainScreen() async {
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
            width: screenWidth,
            height: screenHeight * .8,
            child: Image.asset(
              'assets/images/logo-nobackground.png',
              width: screenWidth * .5,
            ),
          ),
          Container(
            width: screenWidth * .4,
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
