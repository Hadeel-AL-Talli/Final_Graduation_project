import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/shared/network/style/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/product_detail_img_model.dart';
import '../../shared/components/custom_button.dart';
import '/controllers/home_api_controller.dart';
import '/models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  // final Product product;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Future<Product?> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _future =
    //     HomeApiController().getProductDetails(widget.product.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Details',
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
        body:
            // FutureBuilder<Product?>(
            //     future: _future,
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(child: CircularProgressIndicator());
            //       } else if (snapshot.hasData) {
            //         return
            ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
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
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayInterval: const Duration(seconds: 3)),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-vector/colored-realistic-oil-product-with-coconut-tea-tree-peanut-bottles-oil_1284-54789.jpg?t=st=1655634419~exp=1655635019~hmac=a48d1e76a2ddee63f96e1b8598115a3fb74e4b5efd8ba1d9d271df65717f1cad&w=1380'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // SingleChildScrollView(
            //   physics: const BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       Container(
            //         height: 180.h,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         child: Image.asset('images/onboarding1.png'),
            //         // Image.network('https://unsplash.com/s/photos/products'
            //         //      snapshot.data!.images[0].imageUrl,
            //         //     ),
            //       ),
            //       SizedBox(
            //         width: 10.w,
            //       ),
            //       Container(
            //         width: 180.w,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         child: Image.asset('images/onboarding1.png'),
            //         // Image.network('https://unsplash.com/s/photos/products'
            //         //     snapshot.data!.images[1].imageUrl
            //         //     ),
            //       ),
            //       SizedBox(
            //         width: 10.w,
            //       ),
            //       Container(
            //         height: 180.h,
            //         // width: 300.w,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         child: Image.asset('images/onboarding1.png'),
            //         // Image.network(
            //         //     snapshot.data!.images[2].imageUrl
            //         //     ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                      'Product Name'
                      // snapshot.data!.nameEn
                      ,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          )

                      // TextStyle(
                      //     fontSize: 22.sp,
                      //     letterSpacing: 2,
                      //     fontFamily: 'Poppins',
                      //     fontWeight: FontWeight.w700)
                      ),
                  const Spacer(),
                  // IconButton(
                  //     icon: const Icon(
                  //       Icons.favorite_outlined,
                  //       color: KPrimaryColor,
                  //       size: 30,
                  //     ),
                  //     onPressed: () {}),

                  // Text('300 \$',
                  //      '${snapshot.data!.price} \$ ',
                  //     style: TextStyle(
                  //         color: KPrimaryColor,
                  //         fontSize: 18.sp,
                  //         letterSpacing: 2,
                  //         fontFamily: 'Muli',
                  //         fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                '300 \$',
                //  '${snapshot.data!.price} \$ ',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 18,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w900),
                // TextStyle(
                //     color: KPrimaryColor,
                //     fontSize: 18.sp,
                //     letterSpacing: 2,
                //     fontFamily: 'Muli',
                //     fontWeight: FontWeight.w900)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                'Product Description',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: 'Muli',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                //  TextStyle(
                //     fontFamily: 'Poppins',
                //     fontSize: 18,
                //     color: Colors.grey,
                //     fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Text(
                'Product Information',
                // snapshot.data!.infoEn,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
                //  TextStyle(fontFamily: 'Poppins', fontSize: 15
                //  ),
              ),
            ),

            SizedBox(
              height: 80.h,
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CustomButton(
                onPress: () {},
                text: 'Add To Cart',
                color: KPrimaryColor,
              ),
            )
          ],
        )
        // } else {
        //   return const Center(
        //     child: Text('NO DATA'),
        //   );
        // }

        );
  }
}
