import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/controllers/auth_api_controller.dart';
import 'package:graduation_project/shared/components/code_text_feild.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with ApiHelper {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  String? _code;
  @override
  void initState() {
    // TODO: implement initState

    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
    _password.dispose();
    _confirmPassword.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    String? code;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'images/Pattern1.png',
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 85.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 40.w,
                  ),
                  SizedBox(width: 12.w),
                  Text('Pal-Pazzar',
                      style: TextStyle(
                          color: Color(0xffF59B14),
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          fontFamily: 'Poppins')),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                height: 600.h,
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
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.color,
                                ),
                              )),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text('Reset Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins')),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Please enter verify code that we’ve sent to your phone number.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontFamily: 'Poppins', fontSize: 12.sp)
                            // TextStyle(
                            //     fontFamily: 'Poppins',
                            //     color: Colors.grey,
                            //     fontSize: 14.sp)
                            ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CodeTextField(
                              textEditingController: _firstCodeTextController,
                              focusNode: _firstFocusNode,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  _secondFocusNode.requestFocus();
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: CodeTextField(
                              textEditingController: _secondCodeTextController,
                              focusNode: _secondFocusNode,
                              onChanged: (value) {
                                value.isNotEmpty
                                    ? _thirdFocusNode.requestFocus()
                                    : _firstFocusNode.requestFocus();
                              },
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: CodeTextField(
                              textEditingController: _thirdCodeTextController,
                              focusNode: _thirdFocusNode,
                              onChanged: (value) {
                                value.isNotEmpty
                                    ? _fourthFocusNode.requestFocus()
                                    : _secondFocusNode.requestFocus();
                              },
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: CodeTextField(
                              textEditingController: _fourthCodeTextController,
                              focusNode: _fourthFocusNode,
                              onChanged: (value) {
                                if (value.isEmpty)
                                  _thirdFocusNode.requestFocus();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppTextField(
                        hint: 'Password',
                        controller: _password,
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                      SizedBox(height: 10.h),
                      AppTextField(
                        hint: 'Password Confirmation',
                        controller: _confirmPassword,
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      CustomButton(
                          onPress: () async {
                            await performResetPassword();
                          },
                          text: ' Save Changes',
                          color: Color(0xffF59B14)),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Future<void> performResetPassword() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (checkCode() && checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_password.text.isNotEmpty && _confirmPassword.text.isNotEmpty) {
      if (_password.text == _confirmPassword.text) {
        return true;
      }
      showSnackBar(context,
          message: 'Password confirmation error!', error: true);
      return false;
    }
    showSnackBar(context, message: 'Enter new Password ', error: true);
    return false;
  }

  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      getVerificationCode();
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter verification code',
      error: true,
    );
    return false;
  }

  String getVerificationCode() {
    return _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
  }

  Future<void> resetPassword() async {
    bool status = await AuthApiController().resetPassword(context,
        phone: widget.phone, code: _code!, password: _password.text);
    if (status) Navigator.pop(context);
  }
}
