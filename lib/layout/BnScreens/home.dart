// ignore: avoid_web_libraries_in_flutter, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/get/home_getx_controller.dart';
import 'package:graduation_project/models/category.dart';
import 'package:graduation_project/models/product.dart';

import '../../controllers/theme_controller.dart';
import '../../shared/network/style/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeGetxController _homeGetxController = Get.put(HomeGetxController());

  List<Category> _categories = <Category>[];
  List<Product> product = <Product>[];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    HomeGetxController().getHome();
  }

  // final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
                icon: const Icon(
                  Icons.brightness_4_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  // themeController.switchTheme();
                }),
          )
        ],
      ),
      body: GetBuilder<HomeGetxController>(
        builder: (controller) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.homeResponse != null) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 180,
                            autoPlay: true,
                            viewportFraction: 0.8,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlayInterval: const Duration(seconds: 3)),
                        itemCount: controller.homeResponse!.slider.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${controller.homeResponse!.slider[itemIndex].imageUrl}'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 106.h,
                  width: 78.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.homeResponse!.categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // onTap: () => Get.to(
                        //   SubCategoriesScreen(
                        //     id: controller.homeResponse!.categories[index].id,
                        //     name: controller.homeResponse!.categories[index].nameEn,
                        //   ),
                        // ),

                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(120),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3.0,
                                    blurRadius: 5.0)
                              ],
                            ),
                            height: 120,
                            width: 100,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: controller
                                      .homeResponse!.categories[index].imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.4),
                                  alignment: Alignment.center,
                                  height: 60,
                                  child: Text(
                                    controller
                                        .homeResponse!.categories[index].nameEn,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Latest Products',
                    style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 301,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 5.0, right: 10.0),
                          child: Container(
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3.0,
                                      blurRadius: 5.0)
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      height: 200,
                                      imageUrl: controller.homeResponse!
                                          .latestProducts[index].imageUrl,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      controller.homeResponse!
                                          .latestProducts[index].nameEn,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          height: 1.3,
                                          fontFamily: 'Muli',
                                          color: Color(0xFF575E67)),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${controller.homeResponse!.latestProducts[index].price.toString()} \$',
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              height: 1.3,
                                              fontFamily: 'Muli',
                                              color: KPrimaryColor),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              color: KPrimaryColor,
                                            ),
                                            onPressed: () {})
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Famous Products',
                    style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 301,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 5.0, right: 10.0),
                          child: Container(
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3.0,
                                      blurRadius: 5.0)
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      height: 200,
                                      imageUrl: controller.homeResponse!
                                          .famousProducts[index].imageUrl,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      controller.homeResponse!
                                          .famousProducts[index].nameEn,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          height: 1.3,
                                          fontFamily: 'Muli',
                                          color: Color(0xFF575E67)),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${controller.homeResponse!.famousProducts[index].price.toString()} \$',
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              height: 1.3,
                                              fontFamily: 'Muli',
                                              color: KPrimaryColor),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              color: KPrimaryColor,
                                            ),
                                            onPressed: () {})
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.warning, size: 80),
                Center(
                    child: Text(
                  'No Data !',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )),
              ],
            );
          }
        },
      ),
    );
  }
}
