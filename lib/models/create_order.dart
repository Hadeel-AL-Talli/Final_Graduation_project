class CreateOrder {
  late List<Cart> cart;
  late String payment_type;
  late String address_id;
  String? card_id;

  CreateOrder();
}

class Cart {
  late int product_id;
  late int quantity;
  Cart(this.product_id, this.quantity);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'product_id': product_id, 'quantity': quantity};
}
