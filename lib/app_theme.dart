import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff39A552);
  static const Color navy = Color(0xff42505C);
  static const Color grey = Color(0xff79828B);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: primary,
        foregroundColor: white,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22,
          color: white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(35),
            right: Radius.circular(35),
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: white,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: black,
        ),
      ));
}
