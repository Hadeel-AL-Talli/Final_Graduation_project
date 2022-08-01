class ProudctDetails {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late double price;

  late String subCategoryId;

  late bool isFavorite;
  late String imageUrl;
  late List<Images> images;
  late SubCategory? subCategory;

  ProudctDetails();
  Map<String , dynamic> toJson(){
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['nameEn'] = this.nameEn;
data['nameAr'] = this.nameAr;
data['price'] = this.price;
data['infoAr'] = this.infoAr;
data['infoEn']= this.infoEn;
data['image_url'] = this.imageUrl;
return data;
   }

  ProudctDetails.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json['id']  == null ? null:json["id"];
    nameEn = json['name_en']  == null ? "":json["name_en"] ;
    nameAr = json['name_ar'] == null ? "":json["name_ar"];
    infoEn = json['info_en'] == null ? "":json["info_en"];
    infoAr = json['info_ar'] == null ? "":json["info_ar"];
    price = json['price'] == null ? 0:double.parse(json['price'].toString());

    subCategoryId = json['sub_category_id'] == null ? "":json["sub_category_id"];
    isFavorite = json['is_favorite'] == null ? false:json["is_favorite"] ;
    imageUrl = json['image_url'] == null ? "":json["image_url"];
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
  // late int objectId;
  late String url;
  late String imageUrl;

  Images();

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? null:json['id'];
    // objectId = json['object_id'];
    url = json['url'] == null ? null:json['url'];
    imageUrl = json['image_url'] == null ? null:json['image_url'];
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
    id = json['id'] == null ? null:json["id"];
    nameEn = json['name_en'] == null ? null:json["name_en"];
    nameAr = json['name_ar'] == null ? null:json["name_ar"];
    categoryId = json['category_id'] == null ? null:json["category_id"];
    image = json['image'] == null ? null:json["image"];
    imageUrl = json['image_url'] == null ? null:json["image_url"];
  }
}