import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/address_api_controller.dart';
import 'package:graduation_project/models/create_address.dart';
import 'package:graduation_project/models/get_addresses_model.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/network/style/colors.dart';
import '../../get/drop_down_controller.dart';
import '../../models/city.dart';
import '../../shared/components/custom_text_feild.dart';
import '../../shared/network/local/shared_pref_controller.dart';
import 'package:graduation_project/get/drop_down_controller.dart';
import 'package:graduation_project/models/city.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:get/get.dart';

class UpdateAddressScreen extends StatefulWidget {
  UpdateAddressScreen(
      {Key? key,
      this.addressName,
      this.addressDescription,
      this.addressId,
      this.addressPhoneNumber,
      this.addressCity})
      : super(key: key);

  int? addressId;
  String? addressName;
  String? addressDescription;
  String? addressPhoneNumber;
  String? addressCity;

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen>
    with ApiHelper {
  DropDownController dropDownController = DropDownController();
  List<City> _cities = <City>[];
  late Future<List<City>> _future;
  bool createDrop = false;
  late City dropdownvalue;
  String index = '1';
  bool createDropDown = false;
  late TextEditingController _addressNameTextEditingController;
  late TextEditingController _addressInfoTextEditingController;
  late TextEditingController _addressPhoneNumberTextEditingController;

  List<GetAddressesModel> _addresses = <GetAddressesModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = DropDownController().getcities();
    _addressPhoneNumberTextEditingController = TextEditingController();
    _addressNameTextEditingController = TextEditingController();
    _addressInfoTextEditingController = TextEditingController();
    _addressNameTextEditingController.text = widget.addressName!;
    _addressInfoTextEditingController.text = widget.addressDescription!;
    _addressPhoneNumberTextEditingController.text = widget.addressPhoneNumber!;
    

    // _addressesModel.contact_number =
    //     _addressPhoneNumberTextEditingController.text;
    // _addressesModel.info = _addressInfoTextEditingController.text;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _addressPhoneNumberTextEditingController.dispose();
    _addressNameTextEditingController.dispose();
    _addressInfoTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/get_addresses');
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Update Address".tr,
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Name".tr,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppTextField(
                    hint: '',
                    controller: _addressNameTextEditingController,
                    prefixIcon: Icons.location_on,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Street Address".tr,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppTextField(
                    hint: '',
                    controller: _addressInfoTextEditingController,
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Phone number".tr,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppTextField(
                    hint: '',
                    controller: _addressPhoneNumberTextEditingController,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "City :".tr,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    FutureBuilder<List<City>>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          _cities = snapshot.data ?? [];
                          if (!createDrop) dropdownvalue = _cities.first;
                          return DropdownButton<City>(
                            value: dropdownvalue,
                            dropdownColor: Theme.of(context).primaryColor,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Theme.of(context).focusColor,
                            ),
                            underline: const SizedBox(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontFamily: 'poppins',
                                  fontSize: 14,
                                ),
                            items: _cities.map((e) {
                              return DropdownMenuItem<City>(
                                value: e,
                                child: Text(
                                    SharedPrefController().language == 'en'
                                        ? e.nameEn
                                        : e.nameAr),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownvalue = value!;
                                createDrop = true;
                                index = value.id.toString();
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
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: double.infinity,
                    child: CustomButton(
                        onPress: () async {
                          await performUpdateAddress();
                        },
                        text: "Update Address".tr,
                        color: KPrimaryColor),
                  ),
                )
              ],
            ),
          ),
        ));
    // } else {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: const [
    //       Icon(Icons.warning, size: 80),
    //       Center(
    //         child: Text(
    //           'No Data !',
    //           style: TextStyle(
    //               fontFamily: 'Poppins',
    //               fontSize: 22,
    //               fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //     ],
    //   );
    // }
  }

  Future<void> performUpdateAddress() async {
    if (checkData()) {
      await UpdateAddress();
    }
  }

  Future<void> UpdateAddress() async {
    bool status = await AddresssApiController().updateAddress(context,
        id: widget.addressId.toString(), address: address);
    // name: _addressNameTextEditingController.text,
    // cityId: index,
    // id: _addressesModel.id.toString(),
    // contact_number: _addressPhoneNumberTextEditingController.text,
    // info: _addressInfoTextEditingController.text);
    // await UpdateProfileApiController().updateProfile(context,
    //     name: _nameTextEditingController.text, cityId: index, gender: _gender);
    if (status) {
      Navigator.pushReplacementNamed(context, '/get_addresses');
    }
  }

  bool checkData() {
    if (_addressNameTextEditingController.text.isNotEmpty &&
        index.isNotEmpty &&
        _addressPhoneNumberTextEditingController.text.isNotEmpty &&
        _addressInfoTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  GetAddressesModel get address {
    GetAddressesModel address = GetAddressesModel();
    address.id = widget.addressId!;
    address.name = _addressNameTextEditingController.text;
    address.info = _addressInfoTextEditingController.text;
    address.contact_number = _addressPhoneNumberTextEditingController.text;
    address.cityId = index;
    return address;
  }
}
