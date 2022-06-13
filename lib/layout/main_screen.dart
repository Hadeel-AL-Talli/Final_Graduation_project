import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/layout/BnScreens/cart_screen.dart';
import 'package:graduation_project/layout/BnScreens/categories_screen.dart';
import 'package:graduation_project/layout/BnScreens/favorite_screen.dart';
import 'package:graduation_project/layout/BnScreens/home.dart';
import 'package:graduation_project/layout/BnScreens/profile_screen.dart';
import 'package:graduation_project/models/bn_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<BnScreen> _bnScreens = <BnScreen>[
    const BnScreen(widget: Home()),
    const BnScreen(widget: CategoriesScreen()),
    const BnScreen(widget: CartScreen()),
    const BnScreen(widget: FavouriteScreen()),
    const BnScreen(widget: ProfileScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bnScreens[_currentIndex].widget,
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 65,
        showElevation: false,
        selectedIndex: _currentIndex,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        onItemSelected: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavyBarItem(
              icon: const Icon(
                Icons.home_outlined,
                size: 25,
                color: KPrimaryColor,
              ),
              title: const Text(
                'Home',
              ),
              textAlign: TextAlign.center,
              activeColor: KPrimaryColor,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.category_outlined,
                  size: 25, color: KPrimaryColor),
              title: const Text(
                'Categories',
              ),
              textAlign: TextAlign.center,
              activeColor: KPrimaryColor,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.shopping_cart_outlined,
                  size: 25, color: KPrimaryColor),
              title: const Text(
                'Cart',
              ),
              textAlign: TextAlign.center,
              activeColor: KPrimaryColor,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.favorite_border,
                  size: 25, color: KPrimaryColor),
              title: const Text(
                'Favorite',
              ),
              textAlign: TextAlign.center,
              activeColor: KPrimaryColor,
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              icon: const Icon(Icons.person_outline_rounded,
                  size: 25, color: KPrimaryColor),
              title: const Text(
                'Profile',
              ),
              textAlign: TextAlign.center,
              activeColor: KPrimaryColor,
              inactiveColor: Colors.grey),
        ],
      ),
    );
  }
}
