import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
     
     Navigator.pushReplacementNamed(context, '/on_boarding_screen');

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Color(0xffF59B14),
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}