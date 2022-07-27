import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/get/favorite_controller.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/modules/Cart/get/cart_getx_controller.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:graduation_project/shared/network/style/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../models/product_detail_img_model.dart';

import '../../shared/components/custom_button.dart';
import '/controllers/home_api_controller.dart';
import '/models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product
  }) : super(key: key);

  final ProudctDetails product;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>with ApiHelper {

   final CartGetxController cartcontroller =
      Get.put<CartGetxController>(CartGetxController());

 FavoriteGetController controller = Get.put(FavoriteGetController());
late Future<Product?> _future;
  
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
   _future =
        HomeApiController().getProductDetails(widget.product.id.toString());
    
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Details".tr,
         //  SharedPrefController().language =='en'? widget.product.nameEn : widget.product.nameAr,
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
            // widget.product.nameEn,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: FutureBuilder<Product?>(
          future: _future,
          builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
             }
             else if (snapshot.hasData ){
             print('has data');
              return ListView(
               
                
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                     SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 180.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            snapshot.data!.images[0].imageUrl,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 210.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:
                          Image.network(snapshot.data!.images[1].imageUrl),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 180.h,
                          // width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:
                          Image.network(snapshot.data!.images[2].imageUrl),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                 
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      //   child: CarouselSlider(
                      //     options: CarouselOptions(
                      //       height: 400,
                      //       initialPage: 0,
                      //       enableInfiniteScroll: true,
                      //       reverse: false,
                      //       autoPlay: true,
                      //       autoPlayInterval: const Duration(seconds: 3),
                      //       autoPlayAnimationDuration:
                      //           const Duration(milliseconds: 800),
                      //       autoPlayCurve: Curves.fastOutSlowIn,
                      //       // enlargeCenterPage: true,
                      //       scrollDirection: Axis.horizontal,
                      //     ),
                      //     items: 
                      //         .map((Images image) {
                      //       return Builder(
                      //         builder: (BuildContext context) {
                      //           return CachedNetworkImage(
                      //             imageUrl: image.imageUrl,
                      //             fit: BoxFit.cover,
                      //             height: 400,
                      //             width: 300,
                      //             placeholder: (context, url) => const Center(
                      //                 child: CircularProgressIndicator()),
                      //             errorWidget: (context, url, error) =>
                      //                 const Icon(Icons.error),
                      //           );
                      //         },
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                    ],
                  ),
            
                
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                            SharedPrefController().language== 'en'
                                            ? snapshot.data!.nameEn
                                            : snapshot.data!.nameAr
                            ,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontFamily: 'Muli',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                )
            
                         
                            ),
                        const Spacer(),
                        // GetX<FavoriteGetController>(
                        //   builder: ((FavoriteGetController controller) {
                        //     return GestureDetector(
                        //             onTap: () {
                        //               controller.addFavoriteProducts(
                        //                   product:
                        //                       controller.productDetails.value!,
                        //                   context: context);
                        //             },
                        //             child: Container(
                        //               width: 55,
                        //               height: 55,
                        //               decoration: BoxDecoration(
                        //                   shape: BoxShape.circle,
                        //                   color: controller.productDetails
                        //                           .value!.isFavorite
                        //                       ? Colors.red
                        //                       : Colors.grey),
                        //               child: const Icon(
                        //                 Icons.favorite,
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           );
                        //   }),
                          
                        // ),
                        //  return  IconButton(
                        //       icon:  Icon(
                        //         Icons.favorite_outlined,
                        //         color:controller.productDetails.value!.isFavorite? 
                        //          KPrimaryColor : Colors.grey,
                        //         size: 30,
                        //       ),
                        //       onPressed: () {
                        //         controller.addFavoriteProducts(product: controller.productDetails.value!, context: context);
                        //       });
                       
            
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      // '300 \$',
                       '${snapshot.data!.price} \$ ',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 18,
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w900),
                  
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text(
                      "Product Description".tr,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                     
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Text(
                      SharedPrefController().language == 'en'? 
                      
                       snapshot.data!.infoEn : snapshot.data!.infoAr ,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                   
                    ),
                  ),
            
                  SizedBox(
                    height: 80.h,
                  ),
            
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CustomButton(
                      onPress: () async{
                        // insert to cart table (local DB)
                     await create();
                      },
                      text:"Add To Cart".tr,
                      color: KPrimaryColor,
                    ),
                  )
                ],
              
            );
             }

             else {
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
                  ),
                ),
              ],
            );
             }
           
          }
        )
     

        );
  }


  Future<void> create() async {
    
    bool created = await CartGetxController.to.createCart(widget.product);
    
    String message = created ? 'Added successfully' : 'Failed to add';
    showSnackBar(context, message: message, error: !created);
  }
}
