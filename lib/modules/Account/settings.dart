import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/locale/locale_controller.dart';
import 'package:graduation_project/modules/Account/change_password_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.find();
    return Scaffold(
    appBar:  AppBar(

        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
       
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Settings".tr , style:TextStyle(fontFamily: 'Poppins' , fontWeight: FontWeight.bold, fontSize:18 , color: Colors.black)),),

      body: ListView(
        children: [
       ListTile(
         leading: Icon(Icons.notifications_active , color: Color(0xffF59B14),),
         title: Text("Notifications".tr),
         
       ),
      

        ExpansionTile(
          leading: Icon(Icons.language , color: Color(0xffF59B14),),
          title: Text("Language".tr),
          children: [
            TextButton(onPressed: (){
              controller.changeLang("en");
            }, child: Text('English')),
            TextButton(onPressed: (){
              controller.changeLang("ar");
            }, child: Text('العربية')),

          ],
        ),
          ListTile(
         leading: Icon(Icons.lock , color: Color(0xffF59B14),),
         title: Text("Change Password".tr),
         onTap: (){
           Get.to(ChangePasswordScreen());
         },
         
       ),
        ],
      ),
    );
  }


  
}
