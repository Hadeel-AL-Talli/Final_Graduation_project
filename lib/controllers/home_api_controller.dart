import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:graduation_project/models/category.dart';
import 'package:graduation_project/models/faq.dart';
import 'package:graduation_project/models/home_response.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:graduation_project/shared/network/remote/api_setting.dart';

import 'package:http/http.dart' as http;

import '../models/contact_request.dart';
import '../models/product.dart';

class HomeApiController with ApiHelper {
  Future<HomeResponse?> showHome() async {
    var url = Uri.parse(ApiSetting.home);
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return HomeResponse.fromJson(jsonDecode(response.body)['data']);
    }
    return null;
  }

  Future<List<Category>> getCategories() async {
    var url = Uri.parse(ApiSetting.categories);

    var response = await http.get(url, headers: headers);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;

      return categoriesJsonArray
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  /* get Subcategory */
  Future<List<SubCategory>> getSubCategories(String id) async {
    var url = Uri.parse(ApiSetting.subCategory.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var subcategoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return subcategoriesJsonArray
          .map((jsonObject) => SubCategory.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<Product>> getProducts(String id) async {
    var url = Uri.parse(ApiSetting.products.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var productsJsonArray = jsonDecode(response.body)['list'] as List;
      return productsJsonArray
          .map((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    }
    return [];
  }


  Future<Product?> getProductDetails(String id) async {
    var url = Uri.parse(ApiSetting.productDetails.replaceFirst("{id}", id));
    print(url);
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var productsJsonObject = jsonDecode(response.body)['object'];
      return Product.fromJson(productsJsonObject);
    }
  }

  Future<List<FAQL>> getFaq() async {
    var url = Uri.parse(ApiSetting.faq);
    var response = await http.get(url, headers: headers);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      var faqJsonArray = jsonDecode(response.body)['list'] as List;

      return faqJsonArray
          .map((jsonObject) => FAQL.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<bool> contactRequest(BuildContext context,
      {required ContactRequestModel contactRequest}) async {
    var url = Uri.parse(ApiSetting.contactRequest);

    var response = await http.post(url,
        body: {
          'subject': contactRequest.subject,
          'message': contactRequest.message,
        },
        headers: headers);
    if (response.statusCode == 201) {
      // var contactRequest = ContactRequestModel.fromJson(jsonDecode(response.body));
      showSnackBar(context, message: contactRequest.message);
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

// get favorite product
// add to favorite
}
