import 'package:get/get.dart';

class MyLocale extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "ar":{
      "Welcome to":"أهلاً إلى ",
      "Pal-Pazzar":"بال بازار",
      "welcome": "أهلاً بك في بال بازار",
       "Settings":"الإعدادات",
       "Notifications":"الإشعارات",
       "Language":"اللغة",
       "Change Password":"تغيير كلمة المرور "

    },
    "en":{
      "Welcome to":"Welcome to",
      "Pal-Pazzar":"Pal-Pazzar",
      "welcome":"Welcome to Pal-Pazzar",
      "Settings":"Settings",
      "Notifications":"Notifications",
      "Language":"Language",
      "Change Password":"Change Password"
    }
  };

}