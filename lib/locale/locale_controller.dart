import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';

class MyLocaleController extends GetxController{
  Locale  initialLang =SharedPrefController().languageCode =="ar"? Locale("ar"):Locale("en");
 
  void changeLang(String languageCode){
   Locale locale = Locale(languageCode);
   SharedPrefController().setLanguage(lang: languageCode);
   Get.updateLocale(locale);
  }
}