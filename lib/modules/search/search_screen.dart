import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';

import '../../shared/network/style/colors.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchTextEditingController;

  @override
  initState() {
    _searchTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search',
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/main_screen');
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: AppTextField(
                  hint: 'Enter text to search',
                  controller: _searchTextEditingController,
                  prefixIcon: Icons.search),
            ),
            Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buileListProduct(),
                    separatorBuilder: (context, index) => Container(),
                    itemCount: 10))
          ],
        ));
  }

  Widget buileListProduct() => Padding(
        padding: const EdgeInsets.only(
            top: 15.0, bottom: 5.0, left: 25.0, right: 25.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).shadowColor,
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Theme.of(context).primaryColor),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
                  Container(
                    width: 100,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://img.freepik.com/free-vector/bride-silhouette-with-white-dress_23-2147494158.jpg?t=st=1656090562~exp=1656091162~hmac=4fbc302983c3720de3130f9926c68538b2286ca385229f819ab6650b1b0cc4d1&w=740',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 3,
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bride silhouette with white dress Free ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    height: 1.3,
                                    fontFamily: 'Muli',
                                  )),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          Text(
                            '300 \$',
                            style: TextStyle(
                                fontSize: 14.0,
                                height: 1.3,
                                fontFamily: 'Muli',
                                color: KPrimaryColor),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
