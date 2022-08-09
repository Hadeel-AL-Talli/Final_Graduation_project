import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/controllers/order_api_controller.dart';
import 'package:graduation_project/models/create_order.dart';
import 'package:graduation_project/shared/components/custom_button.dart';

import 'package:graduation_project/models/order_details_model.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

class OrderComplition extends StatefulWidget {
  const OrderComplition({Key? key, required this.order}) : super(key: key);
  final OrderDetailsModel order;

  @override
  State<OrderComplition> createState() => _OrderComplitionState();
}

class _OrderComplitionState extends State<OrderComplition> with ApiHelper {
  late Future<OrderDetailsModel?> _futureOrderDetail;

  @override
  void initState() {
    super.initState();
    _futureOrderDetail =
        OrderApiController().getOrderDetails(widget.order.id.toString());
  }

  late AsyncSnapshot<OrderDetailsModel?> snapshotdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/get_orders');
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Order Completion',
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          ),
        ),
        body: FutureBuilder<OrderDetailsModel?>(
          future: _futureOrderDetail,
          builder: (context, snapshot) {
            snapshotdata = snapshot;
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('waiting');
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              print(snapshot.data);
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
                      child: Text('Products',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  fontSize: 18,
                                  height: 1.3,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w800)),
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      itemCount: snapshot.data!.products!.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 3.2,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
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
                                    image: NetworkImage(snapshot
                                        .data!.products![index].imageUrl!),
                                    width: 120,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          snapshot
                                              .data!.products![index].nameEn!,
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${snapshot.data!.products![index].price}\$',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  height: 1.3,
                                                  fontFamily: 'Muli',
                                                  color: KPrimaryColor),
                                            ),
                                            const Spacer(),
                                            Text(
                                                'Quantity: ${snapshot.data!.products![index].quantity}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontSize: 14,
                                                      height: 1.3,
                                                      fontFamily: 'Muli',
                                                    )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
                      child: Text('Delivery Address',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  fontSize: 18,
                                  height: 1.3,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w800)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: KPrimaryColor,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data!.address!.name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontSize: 15,
                                                    height: 1.3,
                                                    fontFamily: 'Muli',
                                                  )),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                                snapshot.data!.address!
                                                    .contactNumber!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontSize: 15,
                                                      height: 1.3,
                                                      fontFamily: 'Muli',
                                                    )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Container(
                                              width: 290,
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                  '${snapshot.data!.address!.city!.nameEn}, ${snapshot.data!.address!.info!}',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge
                                                      ?.copyWith(
                                                        fontSize: 15,
                                                        height: 1.3,
                                                        fontFamily: 'Muli',
                                                      )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
                      child: Text('Payment',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  fontSize: 18,
                                  height: 1.3,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w800)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                                Row(
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
                                    Text(snapshot.data!.paymentType!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontSize: 15,
                                              height: 1.3,
                                              fontFamily: 'Muli',
                                            )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
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
                                    Text('${snapshot.data!.total}\$',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontSize: 15,
                                              height: 1.3,
                                              fontFamily: 'Muli',
                                            )),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                          onPress: () async {
                            await performCreateOrder();
                            Navigator.pushNamed(context, '/success_order');
                          },
                          text: "Complete Order",
                          color: const Color(0xffF59B14)),
                    ),
                  ],
                ),
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
        ));
  }

  Future<void> performCreateOrder() async {
    if (checkData()) {
      await createOrder();
    }
  }

  bool checkData() {
    if (snapshotdata.data!.paymentType!.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> createOrder() async {
    bool status =
        await OrderApiController().createOrderFun(context, order: order);

    if (status) {
      print(order.payment_type);
      print(order.address_id);
      Navigator.pushReplacementNamed(context, '/success_order');
      print(status);
    } else {
      print('there is worng in process');
    }
  }

  CreateOrder get order {
    CreateOrder order = CreateOrder();
    order.cart = List<Cart>.generate(2, (int index) {
      return Cart(808, 1);
    });
    order.payment_type = snapshotdata.data!.paymentType!;
    order.address_id = '${snapshotdata.data!.address!.id!}';
    order.card_id = '12';
    return order;
  }
}
