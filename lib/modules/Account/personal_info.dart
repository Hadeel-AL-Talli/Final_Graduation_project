import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/update_profile_controller.dart';
import 'package:graduation_project/get/drop_down_controller.dart';
import 'package:graduation_project/models/city.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo>  with ApiHelper{
late TextEditingController _nameTextEditingController;
late Future<List<City>> _future;
List<City> city = [];
late City dropDownValue;
String index = '1';
bool createDropDown = false;
String _gender = SharedPrefController().gender;
String _name = SharedPrefController().name;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
    _nameTextEditingController.text = _name;
    _future =DropDownController().getcities();
  }
@override
  void dispose() {
  _nameTextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
       
        elevation: 0,
        actions: [
          IconButton(onPressed: ()async=> await performUpdateProfile(), icon: Icon(Icons.check), color: Color(0xffF59B14), iconSize: 30,)
        ],
        backgroundColor: Colors.transparent,
        title: Text('Edit Profile' , style:TextStyle(fontFamily: 'Poppins' , fontWeight: FontWeight.bold, fontSize:18 , color: Colors.black)),),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 52.h,
                      ),
                      const Text(
                        "Name  ",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 5.h,),
                      // TextField(
                      //   keyboardType: TextInputType.text,
                      //   controller: _nameTextEditingController,
                      // ),
                      AppTextField(hint: '', controller: _nameTextEditingController, prefixIcon: Icons.person),
                      SizedBox(
                        height: 20.h,
                      ),


                      const Text(
                        "Gender",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Male',style: TextStyle(fontSize: 17),),
                              contentPadding: EdgeInsets.zero,
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
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Female',style: TextStyle(fontSize: 17),),
                              contentPadding: EdgeInsets.zero,
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),


                      const Text(
                        "City :",
                        style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold , fontFamily: 'Poppins'),
                      ),
                      FutureBuilder<List<City>>(
                        future: _future,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            city = snapshot.data ?? [];
                            if(!createDropDown) dropDownValue=city.first;
                            return DropdownButton<City>(
                              value: dropDownValue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              underline: SizedBox(),
                              items: city.map((e) {
                                return DropdownMenuItem<City>(child: Text(e.nameEn),value: e,);
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  dropDownValue = value!;
                                  createDropDown=true;
                                  index=value.id.toString();
                                });
                              },
                            );
                          }
                          else {
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




                      SizedBox(
                        height: 30.h,
                      ),


                     // Center(child: CustomButton(onPress: ()async=> await performUpdateProfile(), text: 'Update', color: Colors.black)),

                      SizedBox(height: 30.h,),
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

Future<void> performUpdateProfile() async {
  if (checkData()) {
    await UpdateProfile();

  }
}
Future<void> UpdateProfile() async {
  bool status = await UpdateProfileApiController().updateProfile(context,
      name: _nameTextEditingController.text,
      cityId: index,
      gender: _gender);
  if (status) {
    SharedPrefController().updateProfile(
        name: _nameTextEditingController.text,
        gender: _gender,
        city: dropDownValue);
    // Navigator.pop(context);
  }
}
bool checkData() {
  if (_nameTextEditingController.text.isNotEmpty &&
      index.isNotEmpty &&
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
}
