import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/favorite_api_controller.dart';
import 'package:graduation_project/models/product.dart';
import 'package:graduation_project/models/product_details.dart';

class FavoriteGetController extends GetxController{
final  FavoriteProductApiController favoriteProductApiController =  FavoriteProductApiController();
  RxList<ProudctDetails> favoriteProducts = <ProudctDetails>[].obs;
  RxList<ProudctDetails> products = <ProudctDetails>[].obs;
  Rx<ProudctDetails?> productDetails = ProudctDetails().obs;
  RxBool loading = false.obs;

  static FavoriteGetController get to => Get.find();

  void onInit() {
    getFavoriteProducts();
    super.onInit();
  }




   Future<void> getFavoriteProducts() async {
      loading.value = true;
      favoriteProducts.value = await favoriteProductApiController.getFavoriteProducts();
      loading.value =false;
      update();
    }

  Future<void> addFavoriteProducts({required ProudctDetails product,required BuildContext context}) async {
    bool status = await  FavoriteProductApiController().addFavoriteProducts(context, id: product.id);
    if(status){
      int index = products.indexWhere((element) => element.id == product.id);
      products[index].isFavorite == false ? favoriteProducts.add(product) : favoriteProducts.removeWhere((element) => element.id == products[index].id);
      products[index].isFavorite = !products[index].isFavorite;
      productDetails.value!.isFavorite = products[index].isFavorite ;
    }
    productDetails.refresh();
    products.refresh();
    favoriteProducts.refresh();
    update();
  }


}