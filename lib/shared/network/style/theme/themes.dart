import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff0e0d12),
    primaryColor: const Color(0xff29282d),
    shadowColor: const Color(0xff0e0d12),
    focusColor: KPrimaryColor,
    errorColor: const Color(0xff29282d),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: KPrimaryColor,
        fontFamily: 'Muli',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Muli',
        fontSize: 14,
        height: 1.3,
      ),
      labelLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
          fontFamily: 'Poppins'),
      bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400),
      displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Color(0xff0e0d12)),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff0e0d12),
        elevation: 0,
        titleTextStyle:
            TextStyle(fontSize: 20, fontFamily: 'Muli', color: Colors.white),
        iconTheme: IconThemeData(
          color: KPrimaryColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff0e0d12),
        )),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: LightScaffoldBackgroundColor,
    primaryColor: Colors.white,
    shadowColor: Colors.grey.withOpacity(0.3),
    focusColor: Colors.grey,
    errorColor: KPrimaryColor,
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Colors.black,
        fontFamily: 'Muli',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Color(0xFF575E67),
        fontFamily: 'Muli',
        fontSize: 14,
        height: 1.3,
      ),
      labelLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 40,
          fontFamily: 'Poppins'),
      bodySmall: TextStyle(
          color: Color(0xFF979797),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400),
      displayLarge: TextStyle(
          color: KPrimaryColor,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightScaffoldBackgroundColor,
      titleTextStyle:
          TextStyle(fontSize: 20, fontFamily: 'Muli', color: Colors.white),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white),
    ),
  );
}
