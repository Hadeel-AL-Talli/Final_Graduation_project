import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(33, 33, 33, 1),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(33, 33, 33, 1), elevation: 0),

    // colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.white,

    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white),
    ),
  );
}
