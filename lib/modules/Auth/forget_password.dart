import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/controllers/auth_api_controller.dart';
import 'package:graduation_project/modules/Auth/reset_password.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:get/get.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with ApiHelper {
  late TextEditingController _phoneTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    _phoneTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                SizedBox(
                  height: 50.h,
                ),
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
                        Row(
                          children: [
                            InkWell(
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
                              width: 30.w,
                            ),
                            Text("Forget Password ? ".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins')
                                // TextStyle(
                                //     fontSize: 22.sp,
                                //     fontWeight: FontWeight.bold,
                                //     fontFamily: 'Poppins'),
                                ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: Text(
                              "Please enter".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontFamily: 'Poppins', fontSize: 11.sp)
                              // TextStyle(
                              //     fontFamily: 'Poppins',
                              //     color: Colors.grey,
                              //     fontSize: 14.sp)
                              ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        AppTextField(
                          hint: "Phone number".tr,
                          controller: _phoneTextEditingController,
                          prefixIcon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomButton(
                            onPress: () async => await performForgetPassword(),
                            text: "send".tr,
                            color: Color(0xffF59B14)),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    }
  }

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> forgetPassword() async {
    bool status = await AuthApiController().forgetPassword(
      context,
      phone: _phoneTextEditingController.text,
    );

    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResetPassword(phone: _phoneTextEditingController.text),
        ),
      );
    }
  }
}
