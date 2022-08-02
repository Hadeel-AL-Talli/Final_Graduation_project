import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/payment_card_api_controller.dart';
import 'package:graduation_project/models/payment_card.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/components/custom_text_feild.dart';
import 'package:graduation_project/shared/network/remote/api_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({Key? key}) : super(key: key);

  @override
  State<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> with ApiHelper {
  
 late TextEditingController _typeTextEditingController;
late TextEditingController _holderNameTextEditingController;
late TextEditingController _cardNumTextEditingController;
late TextEditingController _cvvTextEditingController;
late TextEditingController _expDateTextEditingController;
@override
  void initState() {
    _typeTextEditingController  =TextEditingController();
    _holderNameTextEditingController = TextEditingController();
    _cardNumTextEditingController = TextEditingController ();
    _cvvTextEditingController = TextEditingController();
    _expDateTextEditingController = TextEditingController();
    super.initState();
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _typeTextEditingController.dispose();
    _holderNameTextEditingController.dispose();
    _cardNumTextEditingController.dispose();
    _cvvTextEditingController.dispose();
    _expDateTextEditingController.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
            onPressed: () {
             Navigator.popAndPushNamed(context, '/paymentCardsIndex');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
       backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Card".tr,
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
        ),
      ),

      body:ListView(
        children: [
          
  //  CreditCardWidget(
  //      // cardNumber: _cardNumTextEditingController.text,
  //      cardNumber: _cardNumTextEditingController.text,
  //       expiryDate: _expDateTextEditingController.text,
  //       cardHolderName: _holderNameTextEditingController.text,
  //       cvvCode: _cvvTextEditingController.text,
  //       showBackView: false,
  //       //cardBgColor: Colors.black,
  //       obscureCardNumber: false,
  //       obscureCardCvv: false,
  //       height: 140.h,
  //       textStyle: TextStyle(color: Colors.white),
  //       width: MediaQuery.of(context).size.width,
  //       animationDuration: Duration(milliseconds: 1000), 
  //       onCreditCardWidgetChange: (CreditCardBrand ) {  },
  //   ),
  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Type",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
              
              ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: AppTextField(
        hint: 'Visa or Master only',
         controller: _typeTextEditingController,
          prefixIcon: Icons.payment
          ),
    ),
    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Card Number",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
              
              ),
             
               SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AppTextField(
                  max: 16,
                  hint: "Your Card Number",
                  controller: _cardNumTextEditingController,
                  prefixIcon: Icons.numbers,
                  keyboardType: TextInputType.number,
                  
                ),
              ),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Expiration date",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
              
              ),
                  
                   
              
              
              
               SizedBox(
                height: 5.h,
              ),
         Padding(
                padding: const EdgeInsets.all(5.0),
                child: AppTextField(
                  hint: "DD/MM/YY",
                  controller: _expDateTextEditingController,
                  prefixIcon: Icons.date_range,
                  keyboardType: TextInputType.datetime,
                  
                ),
             
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "CVC",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
              
              ),
                  
                   
              
              
              
               SizedBox(
                height: 5.h,
              ),
         Padding(
                padding: const EdgeInsets.all(5.0),
                child: AppTextField(
                  hint: "CVC",
                  controller: _cvvTextEditingController,
                  prefixIcon: Icons.date_range,
                  keyboardType: TextInputType.datetime,
                  
                ),
             
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Holder Name",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
              
              ),
                  
                   
              
              
              
              const SizedBox(
                height: 10,
              ),
         Padding(
                padding: const EdgeInsets.all(5.0),
                child: AppTextField(
                  hint: "Your Name",
                  controller: _holderNameTextEditingController,
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.text,
                  
                ),
             
              )
            ]
          )
    ),
    
     
Padding(
  padding: const EdgeInsets.all(30.0),
  child:   CustomButton(onPress: () async{
       
        print('done');
await performCreateCard();
       
      
  
  }, text: "Add Card".tr, color: Color(0xffF59B14)),
)
        ],
      )
    );
  }

  
  PaymentCard get card {
    PaymentCard card = PaymentCard();
    card.holderName = _holderNameTextEditingController.text;
    card.cardNumber = _cardNumTextEditingController.text;
    card.cvv = _cvvTextEditingController.text;
    card.expDate = _expDateTextEditingController.text;
    card.type = _typeTextEditingController.text;
    return card;
  }
Future<void> performCreateCard() async {
    if (checkData()) {
      await createCard();
    }
  }

  bool checkData() {
    if (_cardNumTextEditingController.text.isNotEmpty &&
     _holderNameTextEditingController.text.isNotEmpty &&
        _cvvTextEditingController.text.isNotEmpty &&
        _expDateTextEditingController.text.isNotEmpty && _typeTextEditingController.text.isNotEmpty
      
       ) {
          print('checked');
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }
  Future<void> createCard() async {
    bool status =
        await PaymentCardApiController().createCard(context, card: card);
        print(card);
   print(status);
    if (status) {
     
      Navigator.pushReplacementNamed(context, '/paymentCardsIndexs');
      print(status);
    } else {
      print('there is worng in process');
    }
  }

 
}