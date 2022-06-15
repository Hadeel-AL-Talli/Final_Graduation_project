import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/controllers/home_api_controller.dart';
import 'package:graduation_project/models/faq.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  late Future<List<FAQL>> _future;
  List<FAQL> _faq = <FAQL>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().getFaq() as Future<List<FAQL>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'FAQ',
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
        ),
      ),
      body: FutureBuilder<List<FAQL>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _faq = snapshot.data ?? [];
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(20),
                itemCount: _faq.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).shadowColor,
                              // Colors.grey.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ExpansionTile(
                        iconColor: Theme.of(context).focusColor,
                        title: Text(
                          _faq[index].questionEn,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  fontFamily: 'Muli',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                          // TextStyle(
                          //     fontFamily: 'Poppins',
                          //     fontSize: 18,
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                            child: Text(_faq[index].answerEn,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400)
                                // style: TextStyle(
                                //     fontFamily: 'Poppins', color: Colors.grey),
                                ),
                          )
                        ],
                      ),
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
                )),
              ],
            );
          }
        },
      ),
    );
  }
}
