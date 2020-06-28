import 'package:flutter/cupertino.dart';
import 'package:repay/screens/request_screens/payment_request.dart';

Widget notification_clicker(String type) {

  if(type == "payment request"){
     return PaymentRequest();
  }
}