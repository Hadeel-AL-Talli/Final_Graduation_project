import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/order_api_controller.dart';
import 'package:graduation_project/models/order_details_model.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  // final OrderDetailsModel order;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late Future<OrderDetailsModel?> _futureOrderDetail;

  // @override
  // void initState() {
  //   super.initState();
  //   _futureOrderDetail =
  //       OrderApiController().getOrderDetails(widget.order.id.toString());
  // }

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
            'Order Details',
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
                child: Text('Products',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 18,
                        height: 1.3,
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w800)),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: 3,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3.2,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return buildOrderProducts(context);
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
                child: Text('Shipping',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 18,
                        height: 1.3,
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w800)),
              ),
              shippingContainer(context),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
                child: Text('Payment',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 18,
                        height: 1.3,
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w800)),
              ),
              paymentContainer(context),
            ],
          ),
        )

        // FutureBuilder<OrderDetailsModel?>(
        //   future: _futureOrderDetail,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasData) {

        //     } else {
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: const [
        //           Icon(Icons.warning, size: 80),
        //           Center(
        //             child: Text(
        //               'No Data !',
        //               style: TextStyle(
        //                   fontFamily: 'Poppins',
        //                   fontSize: 22,
        //                   fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //         ],
        //       );
        //     }
        //   },
        // )
        );
  }
}

Widget buildOrderProducts(BuildContext context) {
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
          const Image(
            image: NetworkImage(
                'https://static.remove.bg/remove-bg-web/bf3af3e882eb04971b4492a1015ef7e77df29362/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png'),
            width: 120,
            height: 120.0,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 3,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Embroidered Tara Coffee Pot',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 15,
                          height: 1.3,
                          fontFamily: 'Muli',
                        )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Text(
                        '30.00\$',
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.3,
                            fontFamily: 'Muli',
                            color: KPrimaryColor),
                      ),
                      const Spacer(),
                      Text('Quantity: 1',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
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
}

Widget shippingContainer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 2, color: Theme.of(context).errorColor),
          color: Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                const Text(
                  'Order Number',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16.0,
                      height: 1.3,
                      fontFamily: 'Muli',
                      color: KPrimaryColor),
                ),
                const Spacer(),
                Text('568541',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 15,
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
                  'Date Shipping',
                  style: TextStyle(
                      fontSize: 16.0,
                      height: 1.3,
                      fontFamily: 'Muli',
                      color: KPrimaryColor),
                ),
                const Spacer(),
                Text('Feb 19, 2022',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 15,
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
                Text('Credit Card',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 15,
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
                  'Address',
                  style: TextStyle(
                      fontSize: 16.0,
                      height: 1.3,
                      fontFamily: 'Muli',
                      color: KPrimaryColor),
                ),
                const Spacer(),
                Text('2727 New  Owerri',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 15,
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
}

Widget paymentContainer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 2, color: Theme.of(context).errorColor),
          color: Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              Text('Online',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 15,
                        height: 1.3,
                        fontFamily: 'Muli',
                      )),
            ],
          ),
          const SizedBox(
            height: 7,
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
              Text('\$766.86',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 15,
                        height: 1.3,
                        fontFamily: 'Muli',
                      )),
            ],
          ),
        ]),
      ),
    ),
  );
}
