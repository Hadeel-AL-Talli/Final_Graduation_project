class GetOrdersModel {
  late int id;
  late String total;
  late String date;
  late String payment_type;
  late String status;
  late String address_id;
  // late String payment_card_id;
  late String order_products_count;
  GetOrdersModel();
  GetOrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    status = json['status'];
    address_id = json['address_id'];
    // payment_card_id = json['payment_card_id'];
    order_products_count = json['order_products_count'];
    payment_type = json['payment_type'];
  }
}
