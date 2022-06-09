class ContactRequestModel {
  late String subject ;
  late String message;
  ContactRequestModel();
  ContactRequestModel.fromJson(Map<String, dynamic> json){
    subject  = json['subject'];
    message = json['message'];
  }
}