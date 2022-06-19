import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home_api_controller.dart';
import 'package:graduation_project/layout/BnScreens/product_details_screen.dart';
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
  late Future<List<Product>> _future;
  List<Product> _products = <Product>[];
  void initState() {
    super.initState();

    _future = HomeApiController().getProducts(widget.id.toString());
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
        body: FutureBuilder<List<Product>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('waiting');

                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _products = snapshot.data ?? [];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: GridView.builder(
                      itemCount: _products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.45,
                        // mainAxisSpacing: 10,
                        // crossAxisSpacing: 10
                      ),
                      itemBuilder: (context, index) {
                        // return Text(_products[index].nameEn,style:Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20));
                        return InkWell(
                          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: _products[index])));

                          },
                          child: ProductWidget(
                              imageUrl: _products[index].imageUrl,
                              name: SharedPrefController().language == 'en'
                                  ? _products[index].nameEn
                                  : _products[index].nameAr,
                              price: _products[index].price),
                        );
                      }),
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
