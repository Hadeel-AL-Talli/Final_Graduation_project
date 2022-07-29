import 'package:get/get.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/modules/Cart/controller/cart_db_controller.dart';
import 'package:graduation_project/modules/Cart/controller/db_controller.dart';

class CartGetxController extends GetxController{
  RxList<ProudctDetails> cart = <ProudctDetails>[].obs;
  RxBool loading = false.obs;
  final CartDbController _cartDbController = CartDbController();
  static CartGetxController get to => Get.find<CartGetxController>();


  @override
  void onInit() {
    
    readCart();
    super.onInit();
  } 
  Future<void> readCart()async{
 loading.value = true;
 cart.value = await _cartDbController.read();
 loading.value = false;

  }

   Future<bool> createCart(ProudctDetails proudctDetails) async {
    int newRowId = await _cartDbController.create(proudctDetails);
    if (newRowId != 0) {
      proudctDetails.id = newRowId;
      cart.add(proudctDetails);
     
    }
    return newRowId != 0;
  }

Future<bool> deleteCartItem(int id) async{
bool deleted = await _cartDbController.delete(id);
if(deleted){
  int index = cart.indexWhere((element) => element.id == id);
  if (index != -1){
    cart.removeAt(index);
  }
}
return deleted;
}


}