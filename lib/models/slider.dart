class SliderModel {
  late int id;
 late  String objectId;
 late String url;
 late String imageUrl;

  

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'].toString();
    url = json['url'];
    imageUrl = json['image_url'];
  }


}