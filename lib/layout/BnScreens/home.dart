// ignore: avoid_web_libraries_in_flutter, unused_import



import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/get/home_getx_controller.dart';
import 'package:graduation_project/models/category.dart';
import 'package:graduation_project/models/product.dart';





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
    HomeGetxController().getHome() ;

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: GetBuilder<HomeGetxController>(

        builder: (controller)
        {
          if (controller.loading) {
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (controller.homeResponse != null) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                  
                    // Text(
                    //  ' AppLocalizations.of(context)!.home',
                    //   style: TextStyle(
                    //       fontSize: 22.sp,
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: 'Poppins'),
                    // ),
                    const SizedBox(height: 40,),
                    Positioned(
                      top: 60.h,
                      bottom: 20.h,
                      right: 50,
                      left: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Color(0xffE2E2E2),
                          borderRadius: BorderRadius.circular(20),),
                        height: 280.h,
                        width: 500.w,
                        child: CarouselSlider.builder(
                          
                          options: CarouselOptions(
                            height: 270.h,
                            autoPlay: true,
                            
                           // enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 2.0,
                            initialPage: 2,
                            
                          ),
                          itemCount: controller.homeResponse!.slider.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                              Container(
                               
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Image.network(
                                  controller
                                      .homeResponse!.slider[itemIndex].imageUrl,
                                  fit: BoxFit.cover,
                                  
                                  width: double.infinity,
                                ),
                              ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                    'categories ',
                      
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 10,),
                Container(

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
                       
                        
                        child: Container(
                          
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(120)),
                          height: 120,
                          width: 120,
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
                                    Icon(Icons.error),
                              ),
                              
                              Container(
                                color: Colors.black.withOpacity(0.4),
                                alignment: Alignment.center,
                                height: 60,
                                child: Text(
                                  controller
                                      .homeResponse!.categories[index].nameEn,
                                  style:const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )

                            ],
                            
                          ),
                          
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  ' LatestProduct',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
               const SizedBox(
                  height:10,
                ),

                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Container(
                          
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: 300,
                          width: 180,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                 
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom:30, top: 10),
                                  width: double.infinity,
                                  height: 150,
                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.homeResponse!
                                        .latestProducts[index].imageUrl,
                                    fit: BoxFit.contain,
                                    
                                    width: double.infinity,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Container(
                                
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    
                                    Text(
                                      controller.homeResponse!
                                          .latestProducts[index].nameEn,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 15,),
                                    Center(
                                      child: Text('${controller.homeResponse!
                                          .latestProducts[index].price
                                          .toString()} \$'

                                        ,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'FamousProduct',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                Container(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    //itemCount: controller.homeResponse!.categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:const EdgeInsets.only(right: 15),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          height: 250,
                          width: 180,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  //Navigator.pushNamed(context, '/FavoriteScreen');
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.homeResponse!
                                        .famousProducts[index].imageUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Text(
                                      controller.homeResponse!
                                          .famousProducts[index].nameEn,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Center(
                                    child: Text('${controller.homeResponse!
                                        .famousProducts[index].price
                                        .toString()} \$'

                                      ,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    
                    },
                  ),
                ),
              ],
            );
           
          }
          else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [

                Icon(Icons.warning, size: 80),
                Center(child: Text('No Data !', style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),)),
              ],
            );
          }
        },

      ),
    );
  }



  
}