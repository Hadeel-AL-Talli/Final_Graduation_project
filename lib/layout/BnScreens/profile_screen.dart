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
import 'package:graduation_project/shared/network/style/colors.dart';
import 'package:get/get.dart';

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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              )),
          title: Text(
            "Profile".tr,
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
            // TextStyle(
            //     fontSize: 22.sp,
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontFamily: 'Poppins'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Container(
        margin: const EdgeInsets.fromLTRB(25, 20, 25, 0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    // border: Border.all(color: KPrimaryColor),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          // Theme.of(context).shadowColor,
                          // Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      selected: true,
                      leading: Icon(
                        Icons.person,
                        size: 30.0,
                        // color: Colors.white
                        color: Theme.of(context).textTheme.labelLarge?.color,
                        // Color(0xffF59B14),
                      ),
                      title: Text(
                        'Profile',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Get.to(PersonalInfo());
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          // Theme.of(context).shadowColor,
                          // Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'images/order.svg',
                        height: 22,
                        width: 22,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                      ),
                      title: Text(
                        'Order',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          // Theme.of(context).shadowColor,
                          // Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on,
                        size: 30.0,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                      ),
                      title: Text(
                        'Address',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          // Theme.of(context).shadowColor,
                          // Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.payment,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                        size: 30.0,
                      ),
                      title: Text(
                        'Payment',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          // Theme.of(context).shadowColor,
                          // Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 30,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                      ),
                      title: Text(
                        'Settings',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Get.to(Settings());
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          // Theme.of(context).shadowColor,
                          // Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.chat,
                        size: 30,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                      ),
                      title: Text(
                        'Contact Us',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Get.to(ContactRequest());
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          // Theme.of(context).shadowColor,
                          // Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.question_answer_sharp,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                        size: 30,
                      ),
                      title: Text(
                        'FAQ',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Get.to(FAQ());
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          // Theme.of(context).shadowColor,
                          // Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                        size: 30,
                      ),
                      // leading: SvgPicture.asset('images/logout.svg'),
                      title: Text(
                        'Logout',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Muli',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () async {
                        await logout(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/sign_in');
  }
}
