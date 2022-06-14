import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/auth_api_controller.dart';
import 'package:graduation_project/get/drop_down_controller.dart';
import 'package:graduation_project/models/city.dart';
import 'package:graduation_project/models/register_user.dart';
import 'package:graduation_project/modules/Auth/verify_screen.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with ApiHelper {
  DropDownController dropDownController = DropDownController();
  List<City> _cities = <City>[];
  late Future<List<City>> _future;
  bool createDrop = false;
  late City dropdownvalue;
  //late String indexcity;
  String _gender = 'M';
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _passwordTextEditingController;
  int _cityId = 1;
  @override
  void initState() {
    // TODO: implement initState
    _future = DropDownController().getcities();
    _phoneTextEditingController = TextEditingController();
    _nameTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _nameTextEditingController.dispose();
    _passwordTextEditingController.dispose();
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
                SizedBox(height: 70.h),
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
                  height: 700.h,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/sign_in');
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, '/register');
                              },
                              child: Text('Register',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins')
                                  // TextStyle(
                                  //     color: Colors.black,
                                  //     fontSize: 22.sp,
                                  //     fontWeight: FontWeight.bold,
                                  //     fontFamily: 'Poppins'),
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        AppTextField(
                          hint: 'Name',
                          controller: _nameTextEditingController,
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 16.h,
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
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Text('City :',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)
                                  // TextStyle(
                                  //     color: Colors.black,
                                  //     fontSize: 20,
                                  //     fontFamily: 'Poppins',
                                  //     fontWeight: FontWeight.bold),
                                  ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            FutureBuilder<List<City>>(
                              future: _future,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty) {
                                  _cities = snapshot.data ?? [];
                                  if (!createDrop)
                                    dropdownvalue = _cities.first;
                                  return DropdownButton<City>(
                                    value: dropdownvalue,
                                    dropdownColor:
                                        Theme.of(context).primaryColor,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Theme.of(context).focusColor,
                                    ),
                                    underline: SizedBox(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontFamily: 'poppins',
                                          fontSize: 14,
                                        ),
                                    items: _cities.map((e) {
                                      return DropdownMenuItem<City>(
                                        child: Text(e.nameEn),
                                        value: e,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownvalue = value!;
                                        createDrop = true;
                                        _cityId = value.id;
                                       // print(indexcity);
                                        print(dropdownvalue.nameEn);
                                      });
                                    },
                                  );
                                } else {
                                  return Center(
                                    child: Column(
                                      children: const [
                                        Icon(Icons.warning, size: 80),
                                        Text(
                                          'NO DATA',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 11),
                            child: Text('Gender',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)
                                // TextStyle(
                                //   fontFamily: 'Poppins',
                                //   color: Colors.black,
                                //   fontWeight: FontWeight.bold,
                                //   fontSize: 16.sp,
                                // ),
                                ),
                          ),
                        ),
                        RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Male',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)
                              // TextStyle(fontFamily: 'Poppins')
                              ),
                          activeColor: KPrimaryColor,
                          value: 'M',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() {
                                _gender = value;
                              });
                            }
                          },
                        ),
                        RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Female',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)
                              //  TextStyle(fontFamily: 'Poppins')
                              ),
                          activeColor: KPrimaryColor,
                          value: 'F',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() {
                                _gender = value;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomButton(
                            onPress: () async {
                              await performRegister();
                            },
                            text: 'Register',
                            color: Color(0xffF59B14)),
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

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty &&
        _nameTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty &&
        _cities.isNotEmpty &&
        _gender.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> register() async {
    bool status = await AuthApiController().register(context, user: user);

    if (status) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return VerifyCode(phone: _phoneTextEditingController.text);
        }),
      );
    }
  }

  RegisterUser get user {
    RegisterUser user = RegisterUser();
    user.name = _nameTextEditingController.text;
    user.password = _passwordTextEditingController.text;
    user.mobile = _phoneTextEditingController.text;
    user.gender = _gender;
    user.cityId = _cityId;
    return user;
  }
}
