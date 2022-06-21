class ProudctDetails {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late double price;
  late int quantity;
  late double overalRate;
  late int subCategoryId;
  late double productRate;
  late double? offerPrice;
  late bool isFavorite;
  late String imageUrl;
  late List<Images > images;
  late SubCategory? subCategory;


  ProudctDetails();

  ProudctDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = double.parse(json['price'].toString());
    quantity = json['quantity'];
    overalRate = double.parse(json['overal_rate'].toString());
    subCategoryId = json['sub_category_id'];
    productRate =  double.parse(json['product_rate'].toString());
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    subCategory = json['sub_category'] != null
        ? SubCategory.fromJson(json['sub_category'])
        : null;
  }


}

class Images {
  late int id;
  late int objectId;
  late String url;
  late String imageUrl;

  Images();

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }


}

class SubCategory {
  late int id;
  late String nameEn;
  late String nameAr;
  late String categoryId;
  late String image;
  late String imageUrl;



  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    categoryId = json['category_id'];
    image = json['image'];
    imageUrl = json['image_url'];
  }


}