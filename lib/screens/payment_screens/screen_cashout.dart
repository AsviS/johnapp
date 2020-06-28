import 'package:flutter/material.dart';
import 'package:repay/components/no_data.dart';

class ScreenCashOut extends StatefulWidget {
  @override
  _ScreenCashOutState createState() => _ScreenCashOutState();
}

class _ScreenCashOutState extends State<ScreenCashOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
      child: NoData(),
      
    )
    );
  }
}