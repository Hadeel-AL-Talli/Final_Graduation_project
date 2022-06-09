

import 'package:graduation_project/models/category.dart';
import 'package:graduation_project/models/product.dart';
import 'package:graduation_project/models/slider.dart';

class HomeResponse  {
 late List<SliderModel> slider;
late  List<Category> categories;
 late List<Product> latestProducts;
 late List<Product> famousProducts;



 HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider =  <SliderModel>[];
      json['slider'].forEach((v) {
        slider.add( SliderModel.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories =  <Category>[];
      json['categories'].forEach((v) {
        categories.add( Category.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts.add( Product.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts =  <Product>[];
      json['famous_products'].forEach((v) {
        famousProducts.add( Product.fromJson(v));
      });
    }
  }


}