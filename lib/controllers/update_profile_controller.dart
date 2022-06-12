import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:graduation_project/shared/network/remote/api_setting.dart';

import 'package:http/http.dart' as http;
class UpdateProfileApiController with ApiHelper {
  Future<bool> updateProfile(BuildContext context ,{required String name , required String cityId , required String gender}) async{
    var url = Uri.parse(ApiSetting.updateProfile);
    var response = await http.post(url , body: {
      'city_id' : cityId,
      'name': name ,
      'gender': gender,
    },
      headers: headers
    );

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
  Future<bool> changePassword(BuildContext context,
      {required String currentpassword, required String newpassword ,required String confirmpassword}) async {
    var url = Uri.parse(ApiSetting.changePassword);
    var response = await http.post(url, body: {
      'current_password': currentpassword,
      'new_password': newpassword,
      'new_password_confirmation': confirmpassword,
    },
        headers:headers
    );
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