import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/modules/Cart/cart_widget.dart';
import 'package:graduation_project/modules/Cart/get/cart_getx_controller.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with ApiHelper{
  ProudctDetails? _proudctDetails;
   final CartGetxController controller =
      Get.put<CartGetxController>(CartGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     }),
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx((){
        if(CartGetxController.to.loading.value){
           return const Center(child: CircularProgressIndicator());
        }
        else if (CartGetxController.to.cart.isNotEmpty){
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
                ListTile(
                  title:Text(
                      CartGetxController.to.cart[index].nameEn ,
                      style: const TextStyle(fontWeight: FontWeight.bold , color: Colors.red),
                    ),
 trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red.shade800),
                  onPressed: () async =>
                      await delete(CartGetxController.to.cart[index].id),
                ),
                ),
                

                    
              ],
            );
                
          } 

        
          
          );
        }

        else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning,
                  size: 80,
                  color: Colors.grey.shade400,
                ),
                Text(
                  'NO DATA',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    // fontSize: SizeConfig().scaleTextFont(20),
                    fontSize: 20.sp,
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }


   Future<void> delete(int id) async {
    // bool deleted = await Provider.of<ContactProvider>(context, listen: false).delete(id);
    bool deleted = await CartGetxController.to.deleteCartItem(id);
    String message = deleted ? 'Deleted successfully' : 'Delete failed';
    showSnackBar(context, message: message, error: !deleted);
  }
}