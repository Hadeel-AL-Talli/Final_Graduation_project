import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graduation_project/shared/components/custom_button.dart';
import 'package:graduation_project/shared/network/style/colors.dart';

class SuccessOrder extends StatefulWidget {
  const SuccessOrder({Key? key}) : super(key: key);

  @override
  State<SuccessOrder> createState() => _SuccessOrderState();
}

class _SuccessOrderState extends State<SuccessOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: KPrimaryColor,
              radius: 40,
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Success',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 20,
                    height: 1.3,
                    letterSpacing: 1,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w900)),
            const SizedBox(
              height: 10,
            ),
            Text('Thank you for Shopping ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      height: 1.4,
                      fontFamily: 'Muli',
                    )),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  onPress: () async {
                    Navigator.pushNamed(context, '/success_order');
                  },
                  text: "Back To Order",
                  color: const Color(0xffF59B14)),
            ),
          ],
        ),
      ),
    );
  }
}
