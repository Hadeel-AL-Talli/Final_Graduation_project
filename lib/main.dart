import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/layout/BnScreens/home.dart';
import 'package:graduation_project/layout/main_screen.dart';
import 'package:graduation_project/modules/Auth/forget_password.dart';
import 'package:graduation_project/modules/Auth/register.dart';
import 'package:graduation_project/modules/Auth/sign_in.dart';
import 'package:graduation_project/modules/launch_module/splash_screen.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';
import 'modules/launch_module/on_boarding.dart';
import 'modules/launch_module/welcome.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
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
    return ScreenUtilInit(
      designSize:Size(375, 812),
      builder: (BuildContext context, Widget? child) { 
        return  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen':(context)=> SplashScreen(),
          '/on_boarding_screen': (context) => OnBoarding(),
          '/welcome_screen': (context) => const WelcomeScreen(),
          '/register' : (context)=> const Register(),
           '/sign_in' : (context)=> const SignIn(),
          '/forget_password':(context)=> const ForgetPassword(),
          '/home_screen': (context) => Home(),
          '/main_screen': (context) => MainScreen(),

      
        },
      );
       },
      
    );
  }
}
