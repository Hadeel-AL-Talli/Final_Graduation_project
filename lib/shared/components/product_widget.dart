import 'package:flutter/material.dart';

import '../network/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  String imageUrl;
  String name;
  String price;

  //  Function function;
  //final List<Product> products;
  ProductWidget(
      {required this.imageUrl,
      required this.name,
      required this.price,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: function(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).shadowColor,
                    // Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Theme.of(context).primaryColor),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 160.h,
                    width: 200.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    // products is out demo list
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    name,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          height: 1.3,
                          fontFamily: 'Muli',
                        )),
                Row(
                  children: [
                    Text(
                      '$price \$',
                      style: const TextStyle(
                          fontSize: 14.0,
                          height: 1.3,
                          fontFamily: 'Muli',
                          color: KPrimaryColor),
                    ),
                    const Spacer(),
                    IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: KPrimaryColor,
                        ),
                        onPressed: () {})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
