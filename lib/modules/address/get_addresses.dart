import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

import '../../shared/network/local/shared_pref_controller.dart';

class GetAddresses extends StatefulWidget {
  const GetAddresses({Key? key}) : super(key: key);

  @override
  State<GetAddresses> createState() => _GetAddressesState();
}

class _GetAddressesState extends State<GetAddresses> {
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 5.0, right: 10.0),
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).shadowColor,
                        //Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Theme.of(context).primaryColor),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Priscekila',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    height: 1.3,
                                    fontFamily: 'Muli',
                                  )
                          // const TextStyle(
                          //     fontSize: 14.0,
                          //     height: 1.3,
                          //     fontFamily: 'Muli',
                          //     color: Color(0xFF575E67)),
                          ),
                      Text(
                          '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    height: 1.3,
                                    fontFamily: 'Muli',
                                  )
                          // const TextStyle(
                          //     fontSize: 14.0,
                          //     height: 1.3,
                          //     fontFamily: 'Muli',
                          //     color: Color(0xFF575E67)),
                          ),
                      Row(
                        children: const [
                          Text(
                            '0597370501',
                            style: TextStyle(
                                fontSize: 14.0,
                                height: 1.3,
                                fontFamily: 'Muli',
                                color: KPrimaryColor),
                          ),
                          Spacer(),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
