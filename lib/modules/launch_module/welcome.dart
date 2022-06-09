import 'package:flutter/material.dart';
import '../../shared/components/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('images/onboarding4.png'),
          const SizedBox(
            height: 30,
          ),
          Container(
              margin: const EdgeInsets.only(left: 30),
              alignment: Alignment.topLeft,
              child: Image.asset(
                'images/logo.png',
                width: 48,
                height: 48,
              )),
          const Text('Welcome to',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'Poppins')),
          const Text('Pal-Pazzar',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'Poppins')),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              onPress: () {
                Navigator.pushNamed(context, '/sign_in');
              },
              text: 'Sign In',
              color: const Color(0xffF59B14)),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text('Register',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          )
        ],
      )),
    );
  }
}
