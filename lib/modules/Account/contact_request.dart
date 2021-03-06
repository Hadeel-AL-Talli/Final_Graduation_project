import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/controllers/home_api_controller.dart';
import 'package:graduation_project/models/contact_request.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:get/get.dart';
class ContactRequest extends StatefulWidget {
  const ContactRequest({Key? key}) : super(key: key);

  @override
  _ContactRequestState createState() => _ContactRequestState();
}

class _ContactRequestState extends State<ContactRequest> with ApiHelper {
  late TextEditingController _subjectTextEditingController;
  late TextEditingController _messageTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subjectTextEditingController = TextEditingController();
    _messageTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _subjectTextEditingController.dispose();
    _messageTextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Contact Us".tr,
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          // style: TextStyle(
          //     fontFamily: 'Poppins',
          //     fontWeight: FontWeight.bold,
          //     fontSize: 18,
          //     color: Colors.black)
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            height: 500.h,
            width: 500.w,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).shadowColor,
                      // Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("Send a message for us".tr,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins')
                      // TextStyle(
                      //     fontSize: 22.sp,
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily: 'Poppins'),
                      ),
                  SizedBox(
                    height: 50.h,
                  ),
                  AppTextField(
                    hint: "Subject".tr,
                    controller: _subjectTextEditingController,
                    prefixIcon: Icons.subject,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    hint: "Message".tr,
                    controller: _messageTextEditingController,
                    prefixIcon: Icons.message,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  CustomButton(
                    onPress: () async => await performContactRequest(),
                    text: "send".tr,
                    color: Color(0xffF59B14),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performContactRequest() async {
    if (checkData()) {
      await Request();
    }
  }

  bool checkData() {
    if (_subjectTextEditingController.text.isNotEmpty &&
        _messageTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> Request() async {
    bool status = await HomeApiController()
        .contactRequest(context, contactRequest: contactRequest);
    if (status) Navigator.pop(context);
  }

  ContactRequestModel get contactRequest {
    ContactRequestModel contact = ContactRequestModel();
    contact.message = _messageTextEditingController.text;
    contact.subject = _subjectTextEditingController.text;
    return contact;
  }
}
