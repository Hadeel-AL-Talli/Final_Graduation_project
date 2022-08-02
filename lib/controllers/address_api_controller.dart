import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/get_addresses_model.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:http/http.dart' as http;

import '../models/create_address.dart';
import '../shared/network/remote/api_setting.dart';

class AddresssApiController with ApiHelper {
  Future<bool> createAddress(BuildContext context,
      {required CreateAddress address}) async {
    var url = Uri.parse(ApiSetting.createAddress);
    var response = await http.post(url,
        body: {
          'name': address.name,
          'contact_number': address.contact_number,
          'info': address.info,
          'city_id': address.cityId.toString()
        },
        headers: headers);
    if (response.statusCode == 201) {
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

  Future<List<GetAddressesModel>> getAddresses() async {
    var url = Uri.parse(ApiSetting.createAddress);
    print(url);
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var addressesJsonArray = jsonDecode(response.body)['list'] as List;
      return addressesJsonArray
          .map((jsonObject) => GetAddressesModel.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<bool> delAddresses(BuildContext context, {required String id}) async {
    var url = Uri.parse(ApiSetting.deleteAddress.replaceFirst("{id}", id));
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

  Future<bool> updateAddress(BuildContext context,
      {required String id, required GetAddressesModel address}) async {
    var url = Uri.parse(ApiSetting.deleteAddress.replaceFirst("{id}", id));
    print(url);
    var response = await http.put(url,
        body: {
          'name': address.name,
          'info': address.info,
          'contact_number': address.contact_number,
          'city_id': address.cityId,
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