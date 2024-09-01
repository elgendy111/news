import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff39A552);
  static const Color navy = Color(0xff4F5A69);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primary,
      appBarTheme: AppBarTheme(
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
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: white,
        ),
      ));
}
