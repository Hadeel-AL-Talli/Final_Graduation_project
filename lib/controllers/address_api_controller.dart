import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:http/http.dart' as http;

import '../models/create_address.dart';
import '../shared/network/remote/api_setting.dart';

class AddresssApiController with ApiHelper{
  Future<bool> createAddress(BuildContext context,
      {required CreateAddress address}) async {
    var url = Uri.parse(ApiSetting.createAddress);
    print(url);
    var response = await http.post(url, body: {
      'name': address.name,
      'contact_number': address.contact_number,
      'info': address.info,
      'city_id': address.cityId.toString()

    }, headers: headers);
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

    }else{
      showSnackBar(context, message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }
}


// class ApiAddressesController with Helpers
// {
//   Future<List<Addresses>> getAddresses() async {
//     var url = Uri.parse(ApiSettings.addresses);
//     var response = await http.get(url
//         ,headers:{
//           HttpHeaders.authorizationHeader:SharedPrefController().token,
//           'lang':SharedPrefController().language
//         }
//     );
//     print("getFavorite"+response.statusCode.toString());
//     if (response.statusCode == 200) {
//       print("getFavorite"+jsonDecode(response.body)['list'].toString());
//       var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
//       return categoriesJsonArray
//           .map((jsonObject) => Addresses.fromJson(jsonObject))
//           .toList();
//     }
//     return [];
//   }
//   Future<bool> delAddresses(BuildContext context,{required String id}) async {
//     var url = Uri.parse(ApiSettings.addressesDel+id);
//     var response = await http.delete(url,
//         headers:{
//           HttpHeaders.authorizationHeader:SharedPrefController().token,
//           'lang':SharedPrefController().language
//         }
//     );
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       showSnackBar(
//         context: context,
//         message: jsonDecode(response.body)['message'],
//       );
//       //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
//       //   print(jsonObject['token_type'].toString()+"ahmed");
//       return true;
//     } else {
//       showSnackBar(
//         context: context,
//         message: jsonDecode(response.body)['message'],
//         error: true,
//       );
//     }

//     return false;
//   }

//   Future<bool> newAddress(BuildContext context,
//       {required String name, required String info,required String contactNumber,required String cityId}) async {
//     var url = Uri.parse(ApiSettings.addresses);
//     var response = await http.post(url, body: {
//       'name': name,
//       'info': info,
//       'contact_number': contactNumber,
//       'city_id': cityId
//     },
//         headers:{
//           HttpHeaders.authorizationHeader:SharedPrefController().token,
//           'lang':SharedPrefController().language
//         }
//     );
//     if (response.statusCode == 201) {

//       showSnackBar(
//         context: context,
//         message: jsonDecode(response.body)['message'],
//       );
//       //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
//    //   print(jsonObject['token_type'].toString()+"ahmed");
//       return true;
//     } else if (response.statusCode == 400) {
//       showSnackBar(
//         context: context,
//         message: jsonDecode(response.body)['message'],
//         error: true,
//       );
//     }
//     return false;
//   }

// }