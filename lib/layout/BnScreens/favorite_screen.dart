import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graduation_project/controllers/favorite_api_controller.dart';
import 'package:graduation_project/layout/BnScreens/product_details_screen.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late Future<List<ProudctDetails>> _future;
  List<ProudctDetails> _favourite = <ProudctDetails>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = FavoriteProductApiController().getFavoriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Favorite".tr,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontSize: 20)),
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: FutureBuilder<List<ProudctDetails>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _favourite = snapshot.data ?? [];
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: _favourite.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.9),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                product: _favourite[index])));
                  },

                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).shadowColor,
                              // Colors.grey.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        color: Theme.of(context).primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              image: NetworkImage(_favourite[index].imageUrl),
                              width: 120,
                              height: 120.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_favourite[index].infoEn,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontSize: 15,
                                          height: 1.3,
                                          fontFamily: 'Muli',
                                        )),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        _favourite[index].price.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            height: 1.3,
                                            fontFamily: 'Muli',
                                            color: KPrimaryColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],

                  ),
                );
              },
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
        },
      ),
    );
  }
}
