import 'package:flutter/material.dart';
import 'package:repay/screens/payment_process/screen_payment_method.dart';
import 'package:repay/screens/payment_process/screen_payment_bank.dart';
import 'package:repay/screens/payment_process/screen_mpesa.dart';

import 'package:repay/utils/constants.dart';

class PageDeposit extends StatefulWidget {
  @override
  _PageDepositState createState() => _PageDepositState();
}

class _PageDepositState extends State<PageDeposit> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: payment_controller,
        children: <Widget>[
          ScreenPaymentMethod(),
          ScreenPaymentBank(),
          ScreenMpesa()
        ],
      ),
      
    );
  }
}

enum payment_method {
bank_payment,
result,
mpesa
}