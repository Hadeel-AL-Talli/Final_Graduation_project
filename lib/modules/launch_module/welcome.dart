import 'package:flutter/material.dart';
import '../../shared/components/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          SizedBox(
            height: 20.h,
          ),
          Image.asset('images/onboarding4.png'),
          SizedBox(
            height: 30.h,
          ),
          Container(
              margin: EdgeInsets.only(left: 30.w),
              alignment: Alignment.topLeft,
              child: Image.asset(
                'images/logo.png',
                width: 48.w,
                height: 48.h,
              )),
          Text(
            "Welcome to".tr,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 40.sp),
//            Text("Welcome to".tr,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 40,
//                   fontFamily: 'Poppins')),
//            Text("Pal-Pazzar".tr,
//               style: TextStyle(
//                   color: Colors.black,

//                   fontWeight: FontWeight.bold,
//                   fontSize: 40,
//                   fontFamily: 'Poppins')
            // TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 40,
            //     fontFamily: 'Poppins')
          ),
          Text(
            "Pal-Pazzar".tr,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: 'Poppins'),
            // TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 40,
            //     fontFamily: 'Poppins')
          ),
          SizedBox(
            height: 40.h,
          ),
          CustomButton(
              onPress: () {
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              text:"Sign In".tr,
              color: const Color(0xffF59B14)),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
            child: Text(
              "Register".tr,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
              // TextStyle(
              //     color: Colors.black,
              //     fontFamily: 'Poppins',
              //     fontWeight: FontWeight.bold,
              //     fontSize: 15.sp)
            ),
          )
        ],
      )),
    );
  }
}
