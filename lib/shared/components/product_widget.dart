import 'package:flutter/material.dart';



class ProductWidget extends StatelessWidget {
  String imageUrl ;
  String name ;
  String price;
  
 //  Function function;
  //final List<Product> products;
   ProductWidget({ required this.imageUrl ,required this.name ,required this.price,  Key? key  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     // onTap: function(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
   Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              // child: Hero(
                
              //   tag: 'tag',
              //   child: Image.asset(imageUrl),
              // ),
            ),
          ),
          Image.network(imageUrl),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              // products is out demo list
              name,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}