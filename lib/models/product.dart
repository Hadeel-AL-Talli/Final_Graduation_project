
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/models/slider.dart';

class Product {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late String price;
  late String quantity;
  //late int overalRate;
  late String subCategoryId;
  //late int productRate;
  late Null offerPrice;
  late bool isFavorite;
  late String imageUrl;

  late List<SliderModel> images;
  late SubCategory subCategory;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'].toString();
    quantity = json['quantity'].toString();
    //overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'].toString();
    //productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];

    if (json.containsKey('images') && json['images'] != null) {
      images = <SliderModel>[];
      json['images'].forEach((v) {
        images.add(SliderModel.fromJson(v));
      });
    }

    if (json.containsKey('sub_category') && json['sub_category'] != null) {
      subCategory = SubCategory.fromJson(json['sub_category']);
    }
  }
}
