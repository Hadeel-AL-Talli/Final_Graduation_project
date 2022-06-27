// ignore: avoid_web_libraries_in_flutter, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/get/home_getx_controller.dart';
import 'package:graduation_project/layout/BnScreens/product_details_screen.dart';
import 'package:graduation_project/models/category.dart';
import 'package:graduation_project/models/product.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/modules/search/search_screen.dart';

import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../modules/SubCategories/sub_categories.dart';
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
  List<ProudctDetails> productDetails = <ProudctDetails>[];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    HomeGetxController().getHome();
  }

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: IconButton(
              icon: const Icon(
                Icons.search_rounded,
                size: 27,
              ),
              onPressed: () {
                Get.to(SearchScreen());
              }),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: () {
                  themeController.switchTheme();
                }),
          )
        ],
      ),
      body: GetBuilder<HomeGetxController>(
        builder: (controller) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: KPrimaryColor,
                valueColor: AlwaysStoppedAnimation(Colors.grey),
              ),
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
                                image: NetworkImage(controller
                                    .homeResponse!.slider[itemIndex].imageUrl),
                                fit: BoxFit.cover),
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
                      "Categories".tr,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                      // TextStyle(
                      //     fontFamily: 'Muli',
                      //     fontSize: 22.sp,
                      //     fontWeight: FontWeight.bold),
                      // Theme.of(context).textTheme.labelMedium
                      // Theme.of(context).primaryTextTheme.bodyLarge

                      // fontFamily: 'Muli',
                      // fontSize: 22.sp,
                      // fontWeight: FontWeight.bold,
                      // )
                    )),
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
                        onTap: () => Get.to(
                          SubCategoriesScreen(
                            id: controller.homeResponse!.categories[index].id,
                            name: SharedPrefController().language == 'en'
                                ? controller
                                    .homeResponse!.categories[index].nameEn
                                : controller
                                    .homeResponse!.categories[index].nameAr,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(120),
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context).shadowColor,
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
                                      child: CircularProgressIndicator(
                                    backgroundColor: KPrimaryColor,
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.grey),
                                  )),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.4),
                                  alignment: Alignment.center,
                                  height: 60,
                                  child: Text(
                                    SharedPrefController().language == 'en'
                                        ? controller.homeResponse!
                                            .categories[index].nameEn
                                        : controller.homeResponse!
                                            .categories[index].nameAr,
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
                    "Latest Products".tr,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontFamily: 'Muli',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                    // TextStyle(
                    //     fontFamily: 'Muli',
                    //     fontSize: 20.sp,
                    //     fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 320.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product[index].id.toString())));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 5.0,
                                right: 10.0),
                            child: Container(
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).shadowColor,
                                        // Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3.0,
                                        blurRadius: 5.0)
                                  ],
                                  color: Theme.of(context).primaryColor),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        height: 200,
                                        imageUrl: controller.homeResponse!
                                            .latestProducts[index].imageUrl,
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                                    CircularProgressIndicator(
                                          backgroundColor: KPrimaryColor,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.grey),
                                        )),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                          SharedPrefController().language ==
                                                  'en'
                                              ? controller.homeResponse!
                                                  .latestProducts[index].nameEn
                                              : controller.homeResponse!
                                                  .latestProducts[index].nameAr,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                height: 1.3,
                                                fontFamily: 'Muli',
                                              )
                                          // const TextStyle(
                                          //     fontSize: 14.0,
                                          //     height: 1.3,
                                          //     fontFamily: 'Muli',
                                          //     color: Color(0xFF575E67)),
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
                    "Famous Products".tr,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontFamily: 'Muli',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                    // Theme.of(context).textTheme.bodyLarge

                    //       fontFamily: 'Muli',
                    //       fontSize: 20.sp,
                    //       fontWeight: FontWeight.bold,
                    //       ),
                    //  TextStyle(
                    //     fontFamily: 'Muli',
                    //     fontSize: 20.sp,
                    //     fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 320.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {

                           Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product[index])));

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 5.0,
                                right: 10.0),
                            child: Container(
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).shadowColor,
                                        //Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3.0,
                                        blurRadius: 5.0)
                                  ],
                                  color: Theme.of(context).primaryColor),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        height: 200,
                                        imageUrl: controller.homeResponse!
                                            .famousProducts[index].imageUrl,
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                                    CircularProgressIndicator(
                                          backgroundColor: KPrimaryColor,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.grey),
                                        )),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                          SharedPrefController().language ==
                                                  'en'
                                              ? controller.homeResponse!
                                                  .famousProducts[index].nameEn
                                              : controller.homeResponse!
                                                  .famousProducts[index].nameAr,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                height: 1.3,
                                                fontFamily: 'Muli',
                                              )
                                          // const TextStyle(
                                          //     fontSize: 14.0,
                                          //     height: 1.3,
                                          //     fontFamily: 'Muli',
                                          //     color: Color(0xFF575E67)),
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
