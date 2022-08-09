import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graduation_project/layout/BnScreens/product_details_screen.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/modules/Cart/cart_widget.dart';
import 'package:graduation_project/modules/Cart/get/cart_getx_controller.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with ApiHelper {
  ProudctDetails? _proudctDetails;
  final CartGetxController controller =
      Get.put<CartGetxController>(CartGetxController());
  List<ProudctDetails> _products = <ProudctDetails>[];
//List<double> prices = [];
double totalAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Cart".tr,
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          ),
        ),
        body: Obx(() {
          if (CartGetxController.to.loading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (CartGetxController.to.cart.isNotEmpty) {
            return ListView.builder(
                itemCount: CartGetxController.to.cart.length,
                padding: EdgeInsets.symmetric(
                  // horizontal: SizeConfig().scaleWidth(20),
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
//                 ListTile(
//                   title:Text(
//                       CartGetxController.to.cart[index].nameEn.toString() ,
//                       style: const TextStyle(fontWeight: FontWeight.bold , color: Colors.red),
//                     ),
//  trailing: IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red.shade800),
//                   onPressed: () async =>
//                       await delete(CartGetxController.to.cart[index].id!),
//                 ),
//                 ),

                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              
                              for (int i = 0; i < CartGetxController.to.cart.length; i++) {
  totalAmount =(double.parse(CartGetxController
                                        .to.cart[index].price.toString())*double.parse(CartGetxController
                                        .to.cart[index].quantity.toString()));


                                       // return totalAmount.toString();
}
print(totalAmount.toString());



//                               double cartTotalPrice(){
//   double total=0;
//   _products.forEach(( ProudctDetails item) { total += item.price as double; });
//   print( total);

//   return total;

  
// }


              //                print('jjjj');

              //                 for(var i = 1; i< CartGetxController.to.cart.length; i++){
              //  print(CartGetxController
              //                           .to.cart[index].price! * CartGetxController.to.cart[index].quantity);

              //                 }

          

                            },
                            child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).shadowColor,
                                      // Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3.0,
                                      blurRadius: 5.0)
                                ], color: Theme.of(context).primaryColor),
                                padding: EdgeInsets.all(5),
                                width: 100.w,
                                height: 100.h,
                                child: CachedNetworkImage(
                                    imageUrl: CartGetxController
                                        .to.cart[index].imageUrl!)),
                          ),
//SizedBox(width: 10.w,),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                    SharedPrefController().language == 'en'
                                        ? CartGetxController
                                            .to.cart[index].nameEn
                                            .toString()
                                        : CartGetxController
                                            .to.cart[index].nameAr
                                            .toString(),
                                    style: TextStyle(color: Color(0xffF59B14))),
                                Text(
                                    CartGetxController.to.cart[index].price
                                            .toString() +
                                        '\$',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),

                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.delete_outline,
                                    color: Colors.red.shade800),
                                onPressed: () async{ 
                                 
                                  await delete(
                                    CartGetxController.to.cart[index].id!);
                                }
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        //add product

                                        controller.addQuantity(
                                            CartGetxController
                                                .to.cart[index].id!);
                                        setState(() {});
                                        print('add');
                                      },
                                      icon: Icon(Icons.add_circle,
                                          color: Color(0xffF59B14))),
                                  Text(
                                  //  CartGetxController.to.getQuantity( CartGetxController.to.cart[index].quantity).toString(),
                                      CartGetxController.to.cart[index].quantity
                                          .toString(),

                                     
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(fontSize: 15)),
                                  TextButton(
                                    onPressed: () {
                                      controller.deleteQuantity(
                                          CartGetxController
                                              .to.cart[index].id!);
                                      setState(() {});
                                    },
                                    child: Text('-',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              )
                            ],
                          ),

                       
                        ],

                        
                      ),

                    ],
                  );
                });
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/cart.png',
                  height: 200.h,
                ),
                Center(
                    child: Text(
                  "Your Cart is Empty".tr,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontFamily: 'Muli',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                )),
                SizedBox(
                  height: 20.h,
                ),
                //Looks like you haven’t made your choice yet.
//Let’s shop!
                Center(
                    child: Text(
                  "Looks like you haven’t made your choice yet. \n Let’s shop!"
                      .tr,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontFamily: 'Muli',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                )),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: CustomButton(
                        onPress: () {
                          Navigator.pushNamed(context, '/main_screen');
                        },
                        text: "Shop Now ".tr,
                        color: Color(0xffF59B14)))
              ],
            );
          }
        }),
        bottomSheet:  Visibility(
          visible: CartGetxController.to.cart.isNotEmpty ,
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  InkWell(
                    onTap: (){
                      
                    },
                    child: Container(
                      // padding: EdgeInsets.symmetric(vertical: 20),
                  
                      child: Text(
                        "Total",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontFamily: 'Muli',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Container(
                                    // padding: EdgeInsets.symmetric(vertical: 20),
                  
                                    child: Text(
                                      '',
                                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                            fontFamily: 'Muli',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
            
        
           
                    
                 
                ],
             ),
        ),
        bottomNavigationBar: 
      
              Visibility(
                visible: CartGetxController.to.cart.isNotEmpty ,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButton(
                    color: Color(0xffF59B14),
                    onPress: () {},
                    text: 'Checkout',
                  ),
                ),
              )
           // : Text('')
           );
  }

  Future<void> delete(int id) async {
    // bool deleted = await Provider.of<ContactProvider>(context, listen: false).delete(id);
    bool deleted = await CartGetxController.to.deleteCartItem(id);
    String message = deleted ? 'Deleted successfully' : 'Delete failed';
    showSnackBar(context, message: message, error: !deleted);
  }


  
}
