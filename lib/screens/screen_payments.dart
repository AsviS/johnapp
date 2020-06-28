import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/screens/payment_screens/screen_cashout.dart';
import 'package:repay/screens/payment_screens/screen_deposits.dart';
import 'package:repay/screens/payment_screens/screen_send.dart';
import 'package:repay/theme/colors.dart';

class ScreenPayments extends StatefulWidget {
  @override
  _ScreenPaymentsState createState() => _ScreenPaymentsState();
}

class _ScreenPaymentsState extends State<ScreenPayments> {
  List<Widget> screens = [
    ScreenDeposits(),
    ScreenCashOut(),
    ScreenSend()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 3,
          child: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 50,
                width: double.infinity,
                child: TabBar( 
                 unselectedLabelColor: Colors.black,
                labelStyle: GoogleFonts.archivoNarrow(fontSize:13,fontWeight:FontWeight.w400),
                labelColor: blue,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                new Tab(text: "Deposits",),
                new Tab(text: "Cashouts",),
                new Tab( text: "Transactions",)
            ]),
              ),
             Expanded(child: TabBarView(children: screens))

          ],
          ),
      ),
    );
  }
}