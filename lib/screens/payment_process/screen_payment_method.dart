import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repay/components/button_container.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/theme/colors.dart';

class ScreenPaymentMethod extends StatefulWidget {

  
  @override
  _ScreenPaymentMethodState createState() => _ScreenPaymentMethodState();
}

class _ScreenPaymentMethodState extends State<ScreenPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(icon: Icon(Icons.close, color: Colors.black,),onPressed: () => Navigator.of(context).pop(),)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Payment Methods",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text("Choose you suitable payment method",style: TextStyle(fontWeight:FontWeight.w400, fontSize:16, color: Colors.grey),),
          ),
           SizedBox(height:20),
          StartUpButtom(
            text: "Lipa na Mpesa",
            color: Colors.white,
            text_color: Colors.green,
            onTap: () => payment_controller.animateToPage(2, duration: Duration(milliseconds: 1000), curve: Curves.ease),
          ),
          StartUpButtom(
            text: "Card Payment",
            color: red,
            text_color: Colors.white,
            onTap: null,
          ),
          StartUpButtom(
            text: "RePay agent",
            color: blue,
            text_color: Colors.white,
            onTap: null,
          ),

      ],
      
      ),
      
    );
  }
}