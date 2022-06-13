import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

import 'package:graduation_project/controllers/auth_api_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/modules/Account/contact_request.dart';
import 'package:graduation_project/modules/Account/faq.dart';
import 'package:graduation_project/modules/Account/personal_info.dart';
import 'package:graduation_project/modules/Account/settings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, color: Colors.black,)),
        title: Text('Account', style: TextStyle(fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),), backgroundColor: Colors.transparent , elevation: 0),
       body: Column(
         children: [
          
        Expanded(
          child:  ListView(
           
       
        children: [

          ListTile(
            leading: Icon(Icons.person , color: Color(0xffF59B14),),
           
            title: Text('Profile'),
            onTap: (){
              Get.to(PersonalInfo());
            },
            
          ),
          SizedBox(height: 10,),
           ListTile(
           leading: SvgPicture.asset('images/order.svg'),
            title: Text('Order'),
            onTap: (){
              
            },
            
          ),
          SizedBox(height: 10,),
        ListTile(
            leading: Icon(Icons.location_on , color: Color(0xffF59B14),),
            title: Text('Address'),
            onTap: (){
             
            },
            
          ),
          SizedBox(height: 10,),
           ListTile(
            leading: Icon(Icons.payment , color: Color(0xffF59B14),),
            title: Text('Payment'),
            onTap: (){
              
            },
            
          ),
          SizedBox(height: 10,),
           ListTile(
            leading: Icon(Icons.settings , color: Color(0xffF59B14),),
            title: Text('Settings'),
            onTap: (){
              Get.to(Settings());
            },
            
          ),
          SizedBox(height: 10,),
           ListTile(
            leading: Icon(Icons.chat , color: Color(0xffF59B14),),
            title: Text('Contact Us'),
            onTap: (){
              Get.to(ContactRequest());
            },
            
          ),
          SizedBox(height: 10,),
           ListTile(
            leading: Icon(Icons.question_answer_sharp , color: Color(0xffF59B14),),
            title: Text('FAQ'),
            onTap: (){
              Get.to(FAQ());
            },
            
          ),
          SizedBox(height: 10,),

        ListTile(
           leading: Icon(Icons.logout , color: Color(0xffF59B14),),
          // leading: SvgPicture.asset('images/logout.svg'),
            title: Text('Logout'),
            onTap: ()async{
              await logout(context);
            },
            
          ),
          SizedBox(height: 10,),

       
    ],
    )
        )

         ],
       ),
    );
  }
  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/sign_in');
  }
  }
