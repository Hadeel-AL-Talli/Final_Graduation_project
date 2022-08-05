import 'package:get/get.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/modules/Cart/controller/cart_db_controller.dart';
import 'package:graduation_project/modules/Cart/controller/db_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartGetxController extends GetxController{
  RxList<ProudctDetails> cart = <ProudctDetails>[].obs;
  RxBool loading = false.obs;
  final CartDbController _cartDbController = CartDbController();
  static CartGetxController get to => Get.find<CartGetxController>();
  int _quantity = 1;
int _counter = 0;
double _totalPrice = 0.0;
 //double get totalPrice => _totalPrice;
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
    print(newRowId);
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

void addQuantity(int id) {
   final index = cart.indexWhere((element) => element.id == id);
   cart[index].quantity = cart[index].quantity + 1;
   //_setPrefsItems();
  update();
 }
void deleteQuantity(int id) {
   final index = cart.indexWhere((element) => element.id == id);
   final currentQuantity = cart[index].quantity;
   if (currentQuantity <= 1) {
     currentQuantity == 1;
   } else {
     cart[index].quantity = currentQuantity - 1;
   }
   _setPrefsItems();
   update();
 }

int getQuantity(int quantity) {
   _getPrefsItems();
   return _quantity;
 }

 void addCounter() {
   _counter++;
  _setPrefsItems();
   update();
 }

 void removeCounter() {
   _counter--;
   _setPrefsItems();
   update();
 }

 int getCounter() {
   _getPrefsItems();
   return _counter;
 }


 void _setPrefsItems() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setInt('cart_items', _counter);
   prefs.setInt('item_quantity', _quantity);
   update();
 }


 void _getPrefsItems() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   _counter = prefs.getInt('cart_items') ?? 0;
   _quantity = prefs.getInt('item_quantity') ?? 1;
   _totalPrice = prefs.getDouble('total_price') ?? 0;
   
 }

// void addTotalPrice(double productPrice) {
//    _totalPrice = _totalPrice + productPrice;
//    _setPrefsItems();
//    update();
//  }
 
//  void removeTotalPrice(double productPrice) {
//    _totalPrice = _totalPrice - productPrice;
//    _setPrefsItems();
//    update();
//  }

 double getTotalPrice(ProudctDetails proudctDetails) {
   proudctDetails.price! * proudctDetails.quantity ;
   return _totalPrice;
   
 }
}