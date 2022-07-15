import 'package:graduation_project/models/city.dart';

class GetAddressesModel{
  late int id;
  late String name;
  late String info;
  late String contact_number;
  late String cityId;
  late City city;
  GetAddressesModel();
  GetAddressesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contact_number = json['contact_number'];
    cityId = json['city_id'].toString();
    city = City.fromJson(json['city']);
  }
}