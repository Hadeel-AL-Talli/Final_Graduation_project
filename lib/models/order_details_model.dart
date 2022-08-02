import 'package:graduation_project/models/city.dart';

class OrderDetailsModel {
  late int id;
  late String total;
  late String date;
  late String payment_type;
  late String status;
  late String address_id;
  late String? payment_card_id;
  late String products_count;
  late List<Products> products;
  late PaymentCard? payment_card;
  late Address? address;

  OrderDetailsModel();
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new  Map<String, dynamic>();
    data['id'] = id;
    data['total'] = total;
    data['date'] = date;
    data['payment_type'] = payment_type;
    data['status'] = status;
    data['address_id'] = address_id;
    data['products_count'] = products_count;
    data['payment_card_id'] = payment_card_id;
    return data;
  }

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json['id'];
    total = json['total'];
    date = json['date'];
    payment_type = json['payment_type'];
    status = json['status'];
    address_id = json['address_id'];
    products_count = json['products_count'];
    payment_card_id = json['payment_card_id'];

    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    payment_card = json['payment_card'] != null
        ? PaymentCard.fromJson(json['payment_card'])
        : null;

    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }
}

class Products {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late double price;
  late String imageUrl;
  late String quantity;
  late String order_quantity;
  late String subCategoryId;
  late bool isFavorite;

  Products();

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = double.parse(json['price'].toString());
    quantity = json['quantity'];
    order_quantity = json['order_quantity'];

    subCategoryId = json['sub_category_id'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
  }
}

class Address {
  late int id;
  late String name;
  late String info;
  late String contact_number;
  late String city_id;
  late City city;

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contact_number = json['contact_number'];
    city_id = json['city_id'].toString();
    city = City.fromJson(json['city']);
  }
}

class PaymentCard {
  late int id;
  late String type;
  late String holder_name;
  late String card_number;
  late String exp_date;
  late String cvv;

  PaymentCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    holder_name = json['holder_name'];
    card_number = json['card_number'];
    exp_date = json['exp_date'];
    cvv = json['cvv'];
  }
}
