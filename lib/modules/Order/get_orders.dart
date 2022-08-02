import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/order_api_controller.dart';
import 'package:graduation_project/models/get_orders_model.dart';
import 'package:graduation_project/modules/Order/order_details.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

class GetOrders extends StatefulWidget {
  const GetOrders({Key? key}) : super(key: key);

  @override
  State<GetOrders> createState() => _GetOrdersState();
}

class _GetOrdersState extends State<GetOrders> {
  late Future<List<GetOrdersModel>> _futureOrders;

  List<GetOrdersModel> _orders = <GetOrdersModel>[];

  @override
  void initState() {
    super.initState();
    _futureOrders = OrderApiController().getOrders();
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
          "Orders",
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
        ),
      ),
      body: FutureBuilder<List<GetOrdersModel>>(
        future: _futureOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _orders = snapshot.data ?? [];
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: _orders.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.53,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetails()));
                  },
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
                            Text('#${_orders[index].id}',
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
                            Text('Order at Pal-Pazzar : ${_orders[index].date}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      height: 1.4,
                                      fontFamily: 'Muli',
                                    )),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  const Text(
                                    'Status',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        height: 1.3,
                                        fontFamily: 'Muli',
                                        color: KPrimaryColor),
                                  ),
                                  const Spacer(),
                                  Text(_orders[index].status,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            fontSize: 16,
                                            height: 1.3,
                                            fontFamily: 'Muli',
                                          )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  const Text(
                                    'Payment Method',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        height: 1.3,
                                        fontFamily: 'Muli',
                                        color: KPrimaryColor),
                                  ),
                                  const Spacer(),
                                  Text(_orders[index].payment_type,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            fontSize: 16,
                                            height: 1.3,
                                            fontFamily: 'Muli',
                                          )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  const Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        height: 1.3,
                                        fontFamily: 'Muli',
                                        color: KPrimaryColor),
                                  ),
                                  const Spacer(),
                                  Text('${_orders[index].total}\$',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            fontSize: 16,
                                            height: 1.3,
                                            fontFamily: 'Muli',
                                          )),
                                ],
                              ),
                            ),
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
