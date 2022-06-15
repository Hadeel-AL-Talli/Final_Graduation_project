import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/update_profile_controller.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:get/get.dart';
=======

>>>>>>> 04040c096e9facd96bfdb660c6a4d569d03a4811
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with ApiHelper {
  late TextEditingController _currentpasswordTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _confirmpasswordTextEditingController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _currentpasswordTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmpasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _currentpasswordTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
<<<<<<< HEAD
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
    backgroundColor: Colors.transparent, elevation: 0, title: Text("Change Password".tr , style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),),),
      
=======
            child: const Icon(
              Icons.arrow_back_ios,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Change Password',
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
        ),
      ),
>>>>>>> 04040c096e9facd96bfdb660c6a4d569d03a4811
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
<<<<<<< HEAD
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  SizedBox(
                    height: 50.h,
                  ),
                  AppTextField(
                    hint: "password".tr,
                    controller: _currentpasswordTextEditingController,
                    prefixIcon: Icons.lock,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    hint: "New password".tr,
                    controller: _passwordTextEditingController,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    hint: "Confirm password".tr,
                    controller: _confirmpasswordTextEditingController,
                    prefixIcon: Icons.lock,

                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  CustomButton(
                      onPress: () async {
                       await performChangePassword();
                      },
                      text: "Save".tr,
                      color: Color(0xffF59B14)),

                ],
=======
              child: Container(
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
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AppTextField(
                        hint: 'password',
                        controller: _currentpasswordTextEditingController,
                        prefixIcon: Icons.lock,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AppTextField(
                        hint: ' New password',
                        controller: _passwordTextEditingController,
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AppTextField(
                        hint: ' Confirm password',
                        controller: _confirmpasswordTextEditingController,
                        prefixIcon: Icons.lock,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                        onPress: () async {
                          await performChangePassword();
                        },
                        text: 'Save',
                        color: Color(0xffF59B14)),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
>>>>>>> 04040c096e9facd96bfdb660c6a4d569d03a4811
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performChangePassword() async {
    if (checkData()) {
      await changePassword();
    }
  }

  bool checkData() {
    if (checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_passwordTextEditingController.text.isNotEmpty &&
        _confirmpasswordTextEditingController.text.isNotEmpty) {
      if (_passwordTextEditingController.text ==
          _confirmpasswordTextEditingController.text) {
        return true;
      }
      showSnackBar(context,
          message: 'Password confirmation error!', error: true);
      return false;
    }
    showSnackBar(context, message: 'Enter new Password ', error: true);
    return false;
  }

  Future<void> changePassword() async {
    bool status = await UpdateProfileApiController().changePassword(context,
        currentpassword: _currentpasswordTextEditingController.text,
        newpassword: _passwordTextEditingController.text,
        confirmpassword: _confirmpasswordTextEditingController.text);
    if (status) Navigator.pop(context);
  }
}
