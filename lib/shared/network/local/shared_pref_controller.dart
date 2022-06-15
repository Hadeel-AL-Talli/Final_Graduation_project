
import 'package:graduation_project/models/city.dart';
import 'package:graduation_project/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum PrefKeys { loggedIn, name, id, gender, mobile, cityEn,cityAr,language,token }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(
        PrefKeys.name.toString(), user.name);
    await _sharedPreferences.setString(
        PrefKeys.mobile.toString(), user.mobile);
    await _sharedPreferences.setString(
        PrefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setInt(PrefKeys.id.toString(), user.id);
    await _sharedPreferences.setString(PrefKeys.cityAr.toString(), user.city.nameAr);
    await _sharedPreferences.setString(PrefKeys.cityEn.toString(), user.city.nameEn);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ' + user.token);
  }
  Future<void> updateProfile ({required String name,required String gender,required City city  }) async {
    await _sharedPreferences.setString(PrefKeys.cityAr.toString(),city.nameAr);
    await _sharedPreferences.setString(PrefKeys.cityEn.toString(),city.nameEn);
    await _sharedPreferences.setString(PrefKeys.name.toString(),name);
    await _sharedPreferences.setString(PrefKeys.gender.toString(), gender);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  String get name =>
      _sharedPreferences.getString(PrefKeys.name.toString())??'';

  String get mobile =>
      _sharedPreferences.getString(PrefKeys.mobile.toString())??'';

  String get gender =>
      _sharedPreferences.getString(PrefKeys.gender.toString())??'';

  String get city  =>
      _sharedPreferences.getString(PrefKeys.cityAr.toString())??'';



  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }


  Future<void> setLanguage({required String lang}) async {
    await _sharedPreferences.setString(PrefKeys.language.toString(), lang);
  }

  String get language => _sharedPreferences.getString(PrefKeys.language.toString()) ?? 'en';

  //String get languageCode => _sharedPreferences.getString('language_code') ?? 'en';
}


