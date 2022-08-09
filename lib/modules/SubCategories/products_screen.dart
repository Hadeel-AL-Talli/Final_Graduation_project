import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home_api_controller.dart';
import 'package:graduation_project/layout/BnScreens/product_details_screen.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/components/product_widget.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';

import '../../models/product.dart';

class ProudctScreen extends StatefulWidget {
  final int id;

  ProudctScreen({required this.id});

  @override
  _ProudctScreenState createState() => _ProudctScreenState();
}

class _ProudctScreenState extends State<ProudctScreen> {
  List<ProudctDetails> _foundProducts = <ProudctDetails>[];
  late TextEditingController _searchTextEditingController;

  late Future<List<ProudctDetails>> _future;
  List<ProudctDetails> _products = <ProudctDetails>[];
  void initState() {
    _searchTextEditingController = TextEditingController();

    super.initState();
    _future = HomeApiController().getProducts(widget.id.toString());
  }

  onSearch(String search) {
    setState(() {
      _foundProducts = _products
          .where((element) => element.nameEn.toString().toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Products".tr,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontSize: 20)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: FutureBuilder<List<ProudctDetails>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('waiting');

                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _products = snapshot.data ?? [];
                // _foundProducts = _products;
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: TextField(
                          controller: _searchTextEditingController,
                          onChanged: (val) => onSearch(val),
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.color),
                          decoration: InputDecoration(
                            hintText: 'Enter text to search',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ),
                            prefixIcon: Icon(
                              Icons.search,
                              color:
                                  Theme.of(context).textTheme.labelLarge?.color,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).focusColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // border(borderColor: Theme.of(context).focusColor
                            //     //  borderColor: Colors.black
                            //     )
                            // decoration: const InputDecoration(
                            //   prefixIcon: Icon(
                            //     Icons.search,
                            //   ),
                            //   hintText: 'Enter text to search',
                            // ),
                          ),
                        )),
                    if (_foundProducts.isEmpty)
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          child: GridView.builder(
                              itemCount: _products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.4,
                                // mainAxisSpacing: 10,
                                // crossAxisSpacing: 10
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsScreen(
                                                    product:
                                                        _products[index])));
                                  },
                                  child: ProductWidget(
                                      imageUrl: _products[index].imageUrl.toString(),
                                      name: SharedPrefController().language ==
                                              'en'
                                          ? _products[index].nameEn.toString()
                                          : _products[index].nameAr.toString(),
                                      price: _products[index].price.toString()),
                                );
                              }),
                        ),
                      )
                    else if (_foundProducts.isNotEmpty)
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          child: GridView.builder(
                              itemCount: _foundProducts.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.4,
                                // mainAxisSpacing: 10,
                                // crossAxisSpacing: 10
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsScreen(
                                                    product: _foundProducts[
                                                        index])));
                                  },
                                  child: ProductWidget(
                                      imageUrl: _foundProducts[index].imageUrl.toString(),
                                      name: SharedPrefController().language ==
                                              'en'
                                          ? _foundProducts[index].nameEn.toString()
                                          : _foundProducts[index].nameAr.toString(),
                                      price: _foundProducts[index]
                                          .price
                                          .toString()),
                                );
                              }),
                        ),
                      )
                    else
                      const Center(
                        child: Text(
                          "No Products Found",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                  ],
                );
              } else {
                return Center(
                  child: Text('No Data',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontSize: 20)),
                );
              }
            }));
  }
}
