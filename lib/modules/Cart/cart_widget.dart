// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation_project/models/product_details.dart';
// import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';

// import 'package:provider/provider.dart';

// import 'db_provider.dart';

// class CartWidget extends StatelessWidget {
//  ProudctDetails product;
//   CartWidget(this.product);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10.0),
//       padding: EdgeInsets.all(10.0),
//        decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(15)),
//       child: Row(
//         children: [
//           Container(
//             height: 100,
//             width: 100,
//             child: CachedNetworkImage(imageUrl:product.imageUrl ),
//           ),
//            Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(SharedPrefController().language == 'en'?product.nameEn: product.nameAr,style:TextStyle(fontWeight: FontWeight.bold)),
//                 Text(product.price.toString() + '\$'),
//               ],
//             ),
//           ),
//            IconButton(
//               onPressed: () {
//                 // Provider.of<DatabaseProvider>(context, listen: false)
//                 //     .deleteProductInCart(product.id);
//               },
//               icon: Icon(
//                 Icons.cancel,
//                 size: 20,
//                 color: Colors.redAccent,
//               ))
//         ]
//       ),
//     );
//   }
// }