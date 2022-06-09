import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:graduation_project/models/city.dart';
import 'package:graduation_project/shared/network/remote/api_setting.dart';
import 'package:http/http.dart' as http;
class DropDownController extends GetxController{

   String? selectedValue;
   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getcities();
  }


   final selected = "".obs;
  void setSelected(String value) {
    selected.value = value;

  }

   Future<List<City>> getcities () async{
     var url = Uri.parse(ApiSetting.cities);
     var response =await  http.get(url,
         headers: {
           HttpHeaders.acceptHeader:'application/json',
         }
     );
     print(response.statusCode.toString());
     if (response.statusCode == 200) {

       var citiesJsonArray = jsonDecode(response.body)['list'] as List;
       return citiesJsonArray
           .map((jsonObject) => City.fromJson(jsonObject))
           .toList();
     }
     return [];
   }


}