import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';


mixin ApiHelper {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: const Duration(seconds: 5),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  Map<String, String> get headers {
    var headers = {
      'Accept': 'application/json',
      //'lang': SharedPreferencesController().checkLanguage
    };
    if (SharedPrefController().loggedIn) {
      headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
      headers[HttpHeaders.acceptHeader] = 'application/json';
    }
    return headers;

  }
}