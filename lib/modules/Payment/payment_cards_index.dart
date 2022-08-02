import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/payment_card_api_controller.dart';
import 'package:graduation_project/models/payment_card.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCardsIndex extends StatefulWidget {
  const PaymentCardsIndex({Key? key}) : super(key: key);

  @override
  State<PaymentCardsIndex> createState() => _PaymentCardsIndexState();
}

class _PaymentCardsIndexState extends State<PaymentCardsIndex> with ApiHelper {
   late Future<List<PaymentCard>> _future;
    
  List<PaymentCard> _cards = <PaymentCard>[];
  bool showBackView = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = PaymentCardApiController().getCards();
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
          "Cards".tr,
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //Navigator.popAndPushNamed(context, '/create_card');
                Navigator.pushNamed(context, '/create_card');
              },
              icon: const Icon(
                Icons.add,
                size: 28,
              ))
        ],
      ),

      body: FutureBuilder<List<PaymentCard>> (
        
        future: _future,
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          else if (snapshot.hasData && snapshot.data!.isNotEmpty){
 _cards = snapshot.data ?? [];

 return ListView.builder(
  itemCount: _cards.length,
  itemBuilder: (context, index) {
   return InkWell(
    onTap: (){
      setState(() {
        showBackView = !showBackView;
      });
    },
     child: Stack(
       children: [
         CreditCardWidget(
              cardNumber: _cards[index].cardNumber,
              expiryDate: _cards[index].expDate,
              cardHolderName: _cards[index].holderName,
              cvvCode: _cards[index].cvv,
              showBackView: showBackView,
              cardBgColor: Colors.white,
             // glassmorphismConfig: Glassmorphism.defaultConfig(),
              backgroundImage: 'images/bc.jpg',
             // backgroundNetworkImage: 'image-url'
              obscureCardNumber: true,
              obscureCardCvv: false,
              isHolderNameVisible: true,
              height: 175,
              textStyle: TextStyle(color: Colors.white, fontSize: 18),
              width: MediaQuery.of(context).size.width,
              isChipVisible: false,
              isSwipeGestureEnabled: true,
              animationDuration: Duration(milliseconds: 1000),
              customCardTypeIcons: <CustomCardTypeIcon>[
                          CustomCardTypeIcon(
                            cardType: CardType.visa,
                            cardImage: Image.asset(
                              'images/visa.png',
                              height: 48,
                              width: 48,
                            ),
                          ),
                        ], onCreditCardWidgetChange: (CreditCardBrand ) {  
                          
                        },
          ),

          Positioned(
            left: 10.w,
            bottom: 10.h,
            child: IconButton(onPressed: (){
              //delete
              confirmDelete(_cards[index].id.toString());
            }, icon: Icon(Icons.delete_outline, color: Colors.white,)),
          ),
           Positioned(
            left: 50.w,
            bottom: 10.h,
            child: IconButton(onPressed: (){
              //update
              
            
            }, icon: Icon(Icons.edit, color: Colors.white,)),
          ),

          
       ],
     ),
   );
 },
 );

 
          }

          else {
            return Center(
              child :Text('No Cards Added')
            );
          }
      },),
    );
  }

  confirmDelete(String id){
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
      content:Text( 'Are you sure ',style:  Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),),
      title: Text('Delete'),
      actions: [
        TextButton(onPressed: () async{
await PaymentCardApiController().delCard(context, id: id);
Navigator.push(context, MaterialPageRoute(builder: ((context) => PaymentCardsIndex())));
        }, child: Text('Yes', style:  Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 15),)),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('No', style:Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 15),))
      ],
    ));
  }
}