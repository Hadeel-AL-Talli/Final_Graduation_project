import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/boarding_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;
  // int _currentpage = 0;
  bool isLast = false;

  List<BoardingModel> boardeing = [
    BoardingModel(
        image: 'images/onboarding1.png',
        name: "welcome".tr,
        title:
            'It is the online store that offers all the distinctive Palestinian products in one place'),
    BoardingModel(
        image: 'images/onboarding2.png',
        name: 'Fast Delivery',
        title:
            'We follow a delivery policy that ensures that the product reaches your doorstep in the shortest time.'),
    BoardingModel(
        image: 'images/onboarding3.png',
        name: 'Buy products and enjoy them',
        title:
            'With Pal Bazaar, you will get what you need as soon as possible'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/welcome_screen');
              },
              child: const Text(
                'SKIP',
                style: TextStyle(color: Color(0xfff59B14)),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == boardeing.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                  print('last');
                } else {
                  isLast = false;
                  print('not last');
                }
              },
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildOnBoardingItem(boardeing[index]),
              itemCount: boardeing.length,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 30, 40, 30),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: boardeing.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Color(0xfff59B14),
                      dotColor: Color(0xFF979797),
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 5.0),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: const Color(0xfff59B14),
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushReplacementNamed(
                          context, '/welcome_screen');
                    } else {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildOnBoardingItem(BoardingModel model) => Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              '${model.name}',
              style: const TextStyle(
                  color: Color(0xfff59B14),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
             SizedBox(
              height: 16.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                '${model.title}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              ),
            ),
             SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image(
                  image: AssetImage(
                    '${model.image}',
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
