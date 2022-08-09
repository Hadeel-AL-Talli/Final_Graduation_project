import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/get_addresses_model.dart';
import 'package:graduation_project/models/payment_card.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:http/http.dart' as http;

import '../models/create_address.dart';
import '../shared/network/remote/api_setting.dart';

class PaymentCardApiController with ApiHelper {
  Future<bool> createCard(BuildContext context,
      {required PaymentCard card}) async {
    var url = Uri.parse(ApiSetting.create_get_Card);
    print(url);
    var response = await http.post(url,
        body: {
          'cardNumber': card.cardNumber,
          'holder_name': card.holderName,
          
          'exp_date': card.expDate,
          'cvv': card.cvv,
          'type':card.type
        },
        headers: headers);
        print(response.statusCode);
    if (response.statusCode == 201) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
      );
      print(jsonDecode(response.body)['message']);

      return true;
    } else if (response.statusCode == 400) {
      var message = jsonDecode(response.body)['message'];
      print(response.body);
      showSnackBar(context, message: message, error: true);
    } else {
      showSnackBar(context,
          message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }

  Future<List<PaymentCard>> getCards() async {
    var url = Uri.parse(ApiSetting.create_get_Card);
    print(url);
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var addressesJsonArray = jsonDecode(response.body)['list'] as List;
      return addressesJsonArray
          .map((jsonObject) => PaymentCard.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<bool> delCard(BuildContext context, {required String id}) async {
    var url = Uri.parse(ApiSetting.delete_update_Card.replaceFirst("{id}", id));
    var response = await http.delete(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
      );
     
      return true;
      
    } else {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }

    return false;
    
  }

  Future<bool> updateCard(BuildContext context,
      {required String id, required PaymentCard card}) async {
    var url = Uri.parse(ApiSetting.deleteAddress.replaceFirst("{id}", id));
    print(url);
    var response = await http.put(url,
        body: {
          'holder_name': card.holderName,
          'cardNumber': card.cardNumber,
          'exp_date': card.expDate,
          'cvv': card.cvv,
         'type':card.type
        },
        headers: headers);

    if (response.statusCode == 200) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
      );

      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }

}