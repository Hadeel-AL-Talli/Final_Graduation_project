import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/address_api_controller.dart';
import 'package:graduation_project/get/drop_down_controller.dart';
import 'package:graduation_project/models/city.dart';
import 'package:graduation_project/models/get_addresses_model.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

import '../../shared/network/local/shared_pref_controller.dart';

class GetAddresses extends StatefulWidget {
  const GetAddresses({Key? key}) : super(key: key);

  @override
  State<GetAddresses> createState() => _GetAddressesState();
}

class _GetAddressesState extends State<GetAddresses> with ApiHelper {
  DropDownController dropDownController = DropDownController();
  List<City> _cities = <City>[];
  late Future<List<City>> _future;
  bool createDrop = false;
  late City dropdownvalue;
  int _cityId = 1;

  late Future<List<GetAddressesModel>> _futureAddresses;

  List<GetAddressesModel> _addresses = <GetAddressesModel>[];

  @override
  void initState() {
    _future = DropDownController().getcities();
    super.initState();
    _futureAddresses = AddresssApiController().getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/profile_screen');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Addresses",
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/create_address_screen');
              },
              icon: const Icon(
                Icons.add,
                size: 28,
              ))
        ],
      ),
      body: FutureBuilder<List<GetAddressesModel>>(
        future: _futureAddresses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _addresses = snapshot.data ?? [];
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: _addresses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.59,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 2, color: Theme.of(context).errorColor),
                        color: Theme.of(context).primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_addresses[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        fontSize: 14,
                                        height: 1.3,
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w900)),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(_addresses[index].info,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      height: 1.3,
                                      fontFamily: 'Muli',
                                    )),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Text(
                                  _addresses[index].contact_number,
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      height: 1.3,
                                      fontFamily: 'Muli',
                                      color: KPrimaryColor),
                                ),
                                const Spacer(),
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
                                      if (!createDrop) {
                                        dropdownvalue = _cities.first;
                                      }
                                      return DropdownButton<City>(
                                        value: dropdownvalue,
                                        dropdownColor:
                                            Theme.of(context).primaryColor,
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
                                            child: Text(SharedPrefController()
                                                        .language ==
                                                    'en'
                                                ? e.nameEn
                                                : e.nameAr),
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
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: KPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/update_address_screen');
                                      },
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 17),
                                        child: Text('Edit',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Muli')),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        AddresssApiController().delAddresses(
                                            context,
                                            id: _addresses[index]
                                                .id
                                                .toString());
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Theme.of(context).focusColor,
                                    ))
                              ],
                            )
                          ]),
                    ),
                  ),
                );
              },
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.warning, size: 80),
                Center(
                  child: Text(
                    'No Data !',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
