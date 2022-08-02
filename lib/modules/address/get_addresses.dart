import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/address_api_controller.dart';
import 'package:graduation_project/get/drop_down_controller.dart';
import 'package:graduation_project/models/city.dart';
import 'package:graduation_project/models/get_addresses_model.dart';
import 'package:graduation_project/modules/address/update_address.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

import '../../shared/network/local/shared_pref_controller.dart';
import 'package:get/get.dart';


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
          "Addresses".tr,
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
                                        fontSize: 16,
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text(
                                    _addresses[index].contact_number,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        height: 1.3,
                                        fontFamily: 'Muli',
                                        color: KPrimaryColor),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      
                                      _addresses[index].city.nameEn,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          height: 1.3,
                                          fontFamily: 'Muli',
                                          color: KPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
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
                                        // Navigator.pushNamed(
                                        //     context, '/update_address_screen');

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateAddressScreen(
                                                      addressId:
                                                          _addresses[index].id,
                                                      addressName:
                                                          _addresses[index]
                                                              .name,
                                                      addressDescription:
                                                          _addresses[index]
                                                              .info,
                                                      addressPhoneNumber:
                                                          _addresses[index]
                                                              .contact_number,
                                                      addressCity:
                                                          _addresses[index]
                                                              .city
                                                              .nameEn,
                                                    )));
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
                                    onPressed: (){
                                    confirmDelete(_addresses[index].id.toString());
                                      //  print('set state');
                                      // await   AddresssApiController().delAddresses(
                                      //       context,
                                      //       id: _addresses[index]
                                      //           .id
                                      //           .toString());
                                  
                                   
                                        
                                               
                                      
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
  confirmDelete(String id){
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
      content:Text( 'Are you sure ?'),
      title: Text('Delete'),
      actions: [
        TextButton(onPressed: () async{
await AddresssApiController().delAddresses(context, id: id);
Navigator.push(context, MaterialPageRoute(builder: ((context) => GetAddresses())));
        }, child: Text('Yes')),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('No'))
      ],
    ));
  }
 
}
