import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/locale/locale_controller.dart';
import 'package:graduation_project/modules/Account/change_password_screen.dart';

import '../../shared/components/custom_text_feild.dart';

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
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Settings".tr,
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          // style:
          // const TextStyle(
          //     fontFamily: 'Poppins',
          //     fontWeight: FontWeight.bold,
          //     fontSize: 18,
          //     color: Colors.black)
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            height: 500.h,
            width: 500.w,
            // decoration: BoxDecoration(
            //     color: Theme.of(context).primaryColor,
            //     boxShadow: [
            //       BoxShadow(
            //           color: Theme.of(context).shadowColor,
            //           // Colors.grey.withOpacity(0.2),
            //           spreadRadius: 3.0,
            //           blurRadius: 5.0)
            //     ],
            //     borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
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
                                Icons.notifications_active,
                                color: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.color,
                              ),
                              title: Text(
                                "Notifications".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontFamily: 'Muli',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
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
                            child: ExpansionTile(
                              iconColor: Theme.of(context).focusColor,
                              leading: Icon(
                                Icons.language,
                                color: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.color,
                              ),
                              title: Text(
                                "Language".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontFamily: 'Muli',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                              ),
                              children: [
                                TextButton(
                                    onPressed: () {
                                      controller.changeLang("en");
                                    },
                                    child: Text(
                                      'English',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontFamily: 'Muli',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      controller.changeLang("ar");
                                    },
                                    child: Text(
                                      'Arabic',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              fontFamily: 'Muli',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
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
                                Icons.lock,
                                color: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.color,
                              ),
                              title: Text(
                                "Change Password".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontFamily: 'Muli',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                              ),
                              onTap: () {
                                Get.to(ChangePasswordScreen());
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}