import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/create_order.dart';
import 'package:graduation_project/models/get_addresses_model.dart';
import 'package:graduation_project/models/get_orders_model.dart';
import 'package:graduation_project/models/order_details_model.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:http/http.dart' as http;

import '../models/create_address.dart';
import '../shared/network/remote/api_setting.dart';

class OrderApiController with ApiHelper {
  Future<bool> createOrderFun(BuildContext context,
      {required CreateOrder order}) async {
    var url = Uri.parse(ApiSetting.createOrder);
    var response = await http.post(url,
        body: {
          'cart': order.cart.toList(),
          'payment_type': order.payment_type,
          'address_id': order.address_id,
          'card_id': order.card_id
        },
        headers: headers);
    if (response.statusCode == 200) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
      );
      print(jsonDecode(response.body)['message']);

      return true;
    } else if (response.statusCode == 400) {
      var message = jsonDecode(response.body)['message'];
      showSnackBar(context, message: message, error: true);
    } else {
      showSnackBar(context,
          message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }

  Future<List<OrderDetailsModel>> getOrders() async {
    var url = Uri.parse(ApiSetting.createOrder);
    print(url);
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ordersJsonArray = jsonDecode(response.body)['list'] as List;
      return ordersJsonArray
          .map((jsonObject) => OrderDetailsModel.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<OrderDetailsModel?> getOrderDetails(String id) async {
    var url = Uri.parse(ApiSetting.orderDetails.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var productsJsonObject = jsonDecode(response.body)['data'];
      var object = OrderDetailsModel.fromJson(productsJsonObject);
      print(object.id);
      return object;
    }
  }
}
