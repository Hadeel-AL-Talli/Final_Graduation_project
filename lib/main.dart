import 'package:flutter/material.dart';
import 'modules/launch_module/on_boarding.dart';
import 'modules/launch_module/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/on_boarding_screen',
      routes: {
        '/on_boarding_screen': (context) => OnBoarding(),
        '/welcome_screen': (context) => const WelcomeScreen(),
      },
    );
  }
}
