// import 'package:graduation_project/models/city.dart';
// import 'package:graduation_project/models/product.dart';

// class OrderDetailsModel {
//   int? id;
//   String? total;
//   String? date;
//   String? payment_type;
//   String? status;
//   String? address_id;
//   String? payment_card_id;
//   String? products_count;
//   List<Product>? products;
//   PaymentCard? payment_card;
//   Address? address;

//   OrderDetailsModel(
//       this.id,
//       this.total,
//       this.date,
//       this.payment_type,
//       this.status,
//       this.address_id,
//       this.payment_card_id,
//       this.products_count,
//       this.products,
//       this.payment_card,
//       this.address);

//   OrderDetailsModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'] == null ? null : json["id"];
//     total = json['total'] == null ? "" : json["total"];
//     date = json['date'] == null ? "" : json["date"];
//     payment_type = json['payment_type'] == null ? "" : json["payment_type"];
//     status = json['status'] == null ? "" : json["status"];
//     address_id = json['address_id'] == null ? "" : json["address_id"];
//     payment_card_id =
//         json['payment_card_id'] == null ? "" : (json['payment_card_id']);
//     products_count =
//         json['products_count'] == null ? "" : json["products_count"];

//     if (json['products'] != null) {
//       products = <Product>[];
//       json['products'].forEach((v) {
//         products?.add(Product.fromJson(v));
//       });
//     }

//     payment_card = json['payment_card'] != null
//         ? PaymentCard.fromJson(json['payment_card'])
//         : null;

//     print(json);
//     address =
//         json['address'] != null ? Address.fromJson(json['address']) : null;

//     // payment_card = json['payment_card'] != null
//     //     ? PaymentCard.fromJson(json['payment_card'])
//     //     : null;

//     // address =
//     //     json['address'] != null ? Address.fromJson(json['address']) : null;
//     print(json);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['total'] = total;
//     data['date'] = date;
//     data['payment_type'] = payment_type;
//     data['status'] = status;
//     data['address_id'] = address_id;
//     data['payment_card_id'] = payment_card_id;
//     data['products_count'] = products_count;

//     return data;
//   }
// }

// class Address {
//   late int id;
//   late String name;
//   late String info;
//   late String contact_number;
//   late String city_id;
//   late City city;

//   Address.fromJson(Map<String, dynamic> json) {
//     id = json['id'] == null ? "" : json["id"];
//     name = json['name'] == null ? "" : json["name"];
//     id = json['info'] == null ? "" : json["info"];
//     id = json['contact_number'] == null ? "" : json["contact_number"];
//     id = json['city_id'] == null ? "" : json["city_id"];
//     city = City.fromJson(json['city']);
//   }
// }

// class PaymentCard {
//   late int id;
//   late String type;
//   late String holder_name;
//   late String card_number;
//   late String exp_date;
//   late String cvv;

//   PaymentCard.fromJson(Map<String, dynamic> json) {
//     id = json['id'] == null ? "" : json["id"];
//     type = json['type'] == null ? "" : json["type"];
//     holder_name = json['holder_name'] == null ? "" : json["holder_name"];
//     card_number = json['card_number'] == null ? "" : json["card_number"];
//     exp_date = json['id'] == null ? "" : json["exp_date"];
//     cvv = json['cvv'] == null ? "" : json["cvv"];
//   }
// }

class OrderDetailsModel {
  int? id;
  String? total;
  String? date;
  String? paymentType;
  String? status;
  String? storeId;
  String? userId;
  String? addressId;
  String? paymentCardId;
  String? productsCount;
  List<Products>? products;
  Address? address;
  // PaymentCard? paymentCard;

  OrderDetailsModel({
    this.id,
    this.total,
    this.date,
    this.paymentType,
    this.status,
    this.storeId,
    this.userId,
    this.addressId,
    this.paymentCardId,
    this.productsCount,
    this.products,
    this.address,
    // this.paymentCard
  });

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    productsCount = json['products_count'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    // paymentCard = json['payment_card'] != null
    //     ? PaymentCard.fromJson(json['payment_card'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['date'] = this.date;
    data['payment_type'] = this.paymentType;
    data['status'] = this.status;
    data['store_id'] = this.storeId;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['payment_card_id'] = this.paymentCardId;
    data['products_count'] = this.productsCount;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    // if (this.paymentCard != null) {
    //   data['payment_card'] = this.paymentCard!.toJson();
    // }
    return data;
  }
}

class Products {
  int? id;
  String? nameEn;
  String? nameAr;
  String? infoEn;
  String? infoAr;
  String? price;
  String? quantity;
  String? overalRate;
  String? subCategoryId;
  String? orderQuantity;
  int? productRate;
  Null? offerPrice;
  bool? isFavorite;
  String? imageUrl;
  Pivot? pivot;

  Products(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.infoEn,
      this.infoAr,
      this.price,
      this.quantity,
      this.overalRate,
      this.subCategoryId,
      this.orderQuantity,
      this.productRate,
      this.offerPrice,
      this.isFavorite,
      this.imageUrl,
      this.pivot});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    orderQuantity = json['order_quantity'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['info_en'] = this.infoEn;
    data['info_ar'] = this.infoAr;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['overal_rate'] = this.overalRate;
    data['sub_category_id'] = this.subCategoryId;
    data['order_quantity'] = this.orderQuantity;
    data['product_rate'] = this.productRate;
    data['offer_price'] = this.offerPrice;
    data['is_favorite'] = this.isFavorite;
    data['image_url'] = this.imageUrl;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? orderId;
  String? productId;

  Pivot({this.orderId, this.productId});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    return data;
  }
}

class Address {
  int? id;
  String? name;
  String? info;
  String? contactNumber;
  Null? lat;
  Null? lang;
  int? cityId;
  City? city;

  Address(
      {this.id,
      this.name,
      this.info,
      this.contactNumber,
      this.lat,
      this.lang,
      this.cityId,
      this.city});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    lat = json['lat'];
    lang = json['lang'];
    cityId = json['city_id'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['info'] = this.info;
    data['contact_number'] = this.contactNumber;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    data['city_id'] = this.cityId;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? nameEn;
  String? nameAr;

  City({this.id, this.nameEn, this.nameAr});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    return data;
  }
}

class PaymentCard {
  int? id;
  String? type;
  String? holderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  String? userId;
  String? createdAt;
  String? updatedAt;

  PaymentCard(
      {this.id,
      this.type,
      this.holderName,
      this.cardNumber,
      this.expDate,
      this.cvv,
      this.userId,
      this.createdAt,
      this.updatedAt});

  PaymentCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    holderName = json['holder_name'];
    cardNumber = json['card_number'];
    expDate = json['exp_date'];
    cvv = json['cvv'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['holder_name'] = this.holderName;
    data['card_number'] = this.cardNumber;
    data['exp_date'] = this.expDate;
    data['cvv'] = this.cvv;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
