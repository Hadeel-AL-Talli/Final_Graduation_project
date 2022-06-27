import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/controllers/home_api_controller.dart';
import 'package:graduation_project/layout/BnScreens/home.dart';
import 'package:graduation_project/layout/main_screen.dart';
import 'package:graduation_project/locale/local.dart';
import 'package:graduation_project/locale/locale_controller.dart';
import 'package:graduation_project/models/product.dart';
import 'package:graduation_project/modules/Auth/forget_password.dart';
import 'package:graduation_project/modules/Auth/register.dart';
import 'package:graduation_project/modules/Auth/sign_in.dart';
import 'package:graduation_project/modules/launch_module/splash_screen.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';
import 'package:graduation_project/shared/network/style/colors.dart';
import 'controllers/theme_controller.dart';
import 'layout/BnScreens/product_details_screen.dart';
import 'modules/launch_module/on_boarding.dart';
import 'modules/launch_module/welcome.dart';
import 'modules/search/search_screen.dart';
import 'shared/network/style/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          themeMode: themeController.theme,
          // ThemeMode.light,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          locale: controller.initialLang,
          translations: MyLocale(),
          // home: ProductDetailsScreen(),
          initialRoute: '/splash_screen',
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/on_boarding_screen': (context) => OnBoarding(),
            '/welcome_screen': (context) => const WelcomeScreen(),
            '/register': (context) => const Register(),
            '/sign_in': (context) => const SignIn(),
            '/forget_password': (context) => const ForgetPassword(),
            '/home_screen': (context) => const Home(),
            '/main_screen': (context) => const MainScreen(),
            '/search_screen': (context) =>  SearchScreen(),

          },
        );
      },
    );
  }
}
