
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/auth_api_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/modules/Auth/sign_in.dart';
import 'package:graduation_project/shared/components/code_text_feild.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:get/get.dart';

class VerifyCode extends StatefulWidget {
  
  const VerifyCode({ Key? key  ,required this.phone }) : super(key: key);
  final String phone; 

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> with ApiHelper {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  late String _code;

  @override
  void initState() {
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    
      body: Stack(
        children: [
          
          Image.asset('images/Pattern1.png',fit: BoxFit.fitHeight,height: double.infinity,),
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
                FadeInUp(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 500),
                  from: 50,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      // boxShadow: [
                      //   BoxShadow(
                      //    // color: shadowColor.withOpacity(0.9),
                      //     offset: const Offset(0, -5),
                      //     blurRadius: 20,
                      //   ),
                      // ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Verify Account".tr,
                            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold,fontFamily: 'Poppins')
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Please enter verify code".tr,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _firstCodeTextController,
                                  focusNode: _firstFocusNode,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      _secondFocusNode.requestFocus();
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _secondCodeTextController,
                                  focusNode: _secondFocusNode,
                                  onChanged: (value) {
                                    value.isNotEmpty
                                        ? _thirdFocusNode.requestFocus()
                                        : _firstFocusNode.requestFocus();
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _thirdCodeTextController,
                                  focusNode: _thirdFocusNode,
                                  onChanged: (value) {
                                    value.isNotEmpty
                                        ? _fourthFocusNode.requestFocus()
                                        : _secondFocusNode.requestFocus();
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CodeTextField(
                                  textEditingController:
                                      _fourthCodeTextController,
                                  focusNode: _fourthFocusNode,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      _thirdFocusNode.requestFocus();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          
                          CustomButton(onPress: ()async => await performActivate(), text: "Activate".tr, color:Color(0xffF59B14) )
                           
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> performActivate() async {
    if (checkData()) {
      await activateAccount();
    }
  }

  bool checkData() {
    if (checkCode()) {
      return true;
    }
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

  Future<void> activateAccount() async {
    bool status = await AuthApiController().activate(
      context,
      phone: widget.phone,
      code: _code,
    );
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignIn(),
        ),
      );
    }
  }
}