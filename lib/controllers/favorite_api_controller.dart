import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:graduation_project/models/product.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:graduation_project/shared/network/remote/api_setting.dart';
import 'package:http/http.dart' as http;

class FavoriteProductApiController with ApiHelper {
  Future<List<ProudctDetails>> getFavoriteProducts() async {
    var url = Uri.parse(ApiSetting.favoriteProducts);
    var response = await http.get(url, headers: headers);
    print(url);
    print(headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['list'] as List;
      List<ProudctDetails> favoriteProducts =
          data.map((e) => ProudctDetails.fromJson(e)).toList();
      return favoriteProducts;
    }
    return [];
  }

  Future<bool> addFavoriteProducts(BuildContext context,
      {required int id}) async {
    var url = Uri.parse(ApiSetting.addFavoriteProducts);
    // var response = await http.post(
    //     url,
    //     body: {'product_id': id.toString()},
    //     headers: headers
    // );
    // if (response.statusCode==200) {
    //   showSnackBar(context,  message: 'Added successfully');
    //   return true;
    // } else if (response.statusCode != 500) {
    //   showSnackBar(context, error: true, message: 'Failed to Added');
    // }
    // return false;

    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({'product_id': '$id' /*,"rate":"1"*/});

    request.headers.addAll(headers);

    http.StreamedResponse responseStreamed = await request.send();

    var response = await http.Response.fromStream(responseStreamed);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, message: 'Added successfully');
      return true;
    } else {
      // print(response.reasonPhrase);
      // ignore: use_build_context_synchronously
      showSnackBar(context, error: true, message: 'Failed to Added');
    }
    return false;
  }
}
