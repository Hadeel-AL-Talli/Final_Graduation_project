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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
 
  final List<BnScreen> _bnScreens = <BnScreen>[
    const BnScreen(title: 'Home', widget: Home()),
    const BnScreen(title: 'Categories', widget: CategoriesScreen()),
     const BnScreen(title: 'Cart', widget: CartScreen()),
    const BnScreen(title: 'Favorite', widget: FavouriteScreen()),
    const BnScreen(title: 'Profile', widget: ProfileScreen()),
   
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bnScreens[_currentIndex].widget,
      bottomNavigationBar:BottomNavyBar(
        containerHeight:70,
        onItemSelected: (int value) {
          setState(() {
            _currentIndex = value;
            
          });
          
        },
       
       // backgroundColor: HexColor("#01221D"),
        backgroundColor: Colors.white,
       // color: Color(0xffF59B14),
        
        items:  [
           BottomNavyBarItem(
       icon: Icon(Icons.home),
       title: Text('Home'),
       activeColor:  Color(0xffF59B14),
     ),
      BottomNavyBarItem(
       icon: Icon(Icons.category),
       title: Text('Category'),
       activeColor:  Color(0xffF59B14),
     ),
      BottomNavyBarItem(
       icon: Icon(Icons.shopping_cart),
       title: Text('Cart'),
       activeColor:  Color(0xffF59B14),
     
     ),
     BottomNavyBarItem(
       icon: Icon(Icons.favorite),
       title: Text('Favorite'),
       activeColor:  Color(0xffF59B14),
     
     ),
     BottomNavyBarItem(
       icon: Icon(Icons.person),
       title: Text('Profile'),
       activeColor:  Color(0xffF59B14),
     
     ),
         
        ],
      ),
    );
  }
}
