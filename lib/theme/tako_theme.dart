import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:tako/util/constant.dart';

class TakoTheme {
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.lato(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.lato(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.lato(
      fontSize: 14.0.sp,
      color: Colors.white,
    ),
    headline1: GoogleFonts.lato(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.lato(
      fontSize: 17.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.lato(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    headline4: GoogleFonts.lato(
      fontSize: 21.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      decoration: TextDecoration.none,
    ),
    headline6: GoogleFonts.lato(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: tkDarkerBlue,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: tkDarkBlue,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: tkLightGreen,
        unselectedItemColor: tkGrey,
        backgroundColor: tkDarkBlue,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.black),
        fillColor: MaterialStateProperty.all(tkLightGreen.withAlpha(205)),
      ),
      textTheme: darkTextTheme,
    );
  }
}
