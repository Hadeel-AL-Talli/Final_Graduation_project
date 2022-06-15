import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graduation_project/controllers/home_api_controller.dart';
import 'package:graduation_project/models/product_details.dart';
import 'package:graduation_project/modules/SubCategories/products_screen.dart';
import 'package:graduation_project/shared/network/local/shared_pref_controller.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key , required this.id, required this.name}) : super(key: key);
  final int id;
  final String name;

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  int selectedIndex =0;
  late Future<List<SubCategory>> _future;
  List<SubCategory> _subCategories = <SubCategory>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().getSubCategories(widget.id.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        
          title: Text(
            
           widget.name,
            style:  Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),

          body:  FutureBuilder<List<SubCategory>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _subCategories = snapshot.data ?? [];
           return ListView.builder(
           
            itemCount: _subCategories.length,
           
            itemBuilder: (context,index){

           return  GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProudctScreen(id: _subCategories[index].id,)));
      },
      child: Column(
       
        children: [
         
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Image.network(_subCategories[index].imageUrl, width: double.infinity, height: 250,),
                Text(
                  SharedPrefController().language == 'en'?
                  _subCategories[index].nameEn:_subCategories[index].nameAr,
                 style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontFamily: 'Muli',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color:  
                    Colors.transparent,
                    
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Color(0xffF59B14))
                 ),
          ),



        ],
      ),
    );
           });
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