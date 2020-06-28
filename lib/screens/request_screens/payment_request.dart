import 'package:flutter/material.dart';
import 'package:repay/screens/request_screens/screen_payment_confirmed.dart';
import 'package:repay/screens/request_screens/screen_payment_request.dart';
import 'package:repay/theme/colors.dart';

class PaymentRequest extends StatefulWidget {
  PaymentRequest({Key key}) : super(key: key);

  @override
  _PaymentRequestState createState() => _PaymentRequestState();
}

class _PaymentRequestState extends State<PaymentRequest> {
  List<Widget> screens = [
    ScreenPaymentRequest(),
    ScreenPaymentConfirmed()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
          title: Text("Payment requests"),
          titleSpacing: 0,
          bottom: TabBar(
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontSize:13,fontWeight:FontWeight.w300),
              labelColor: blue,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                new Tab(text: "Payment request",),
                new Tab(text: "Paid payments",),
              ]),
        ),
        body: TabBarView(children: screens),
      ),
    );
  }
}