import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/controllers/auth_api_controller.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';


class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with ApiHelper {
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;
   @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _phoneTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _passwordTextEditingController.dispose();
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
                 SizedBox(
                  height: 50.h,
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 500.h,
                  width: 500.w,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         SizedBox(
                          height: 20.h,
                        ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Text(
                              //'AppLocalizations.of(context)!.signIn',
                              'sign in',
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                        ),
                       
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text('Register',  style: TextStyle(
                            color: Colors.grey,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),),
                        )
                           ],
                         ),
                         SizedBox(
                          height: 50.h,
                        ),
                        AppTextField(
                          hint: 'Phone number',
                          controller: _phoneTextEditingController,
                          prefixIcon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                         SizedBox(
                          height: 16.h,
                        ),
                        AppTextField(
                          hint: 'password',
                          controller: _passwordTextEditingController,
                          prefixIcon: Icons.lock,
                          obscureText: true,
                        ),
                         SizedBox(
                          height: 16.h,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/forget_password');
                            },
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: Text('Forget Password ? ',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700)),
                            )),
                         SizedBox(
                          height: 70.h,
                        ),
                        CustomButton(
                            onPress: () async => await performLogin(),
                            text: 'Sign In',
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

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(

      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      mobile: _phoneTextEditingController.text,
      password: _passwordTextEditingController.text,
    );
    if (status) Navigator.pushReplacementNamed(context, '/main_screen');
  }
}