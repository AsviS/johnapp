import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/pages/make_payments/pay_qrcode/qr_code_scanner.dart';
import 'package:repay/pages/make_payments/send_money_friend/list_friends.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/utils/settings_helper.dart';

class PaymentOptions extends StatefulWidget {
  final MyAppSettings settings;

  const PaymentOptions({Key key, this.settings}) : super(key: key);
  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
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
            child: Text("Make Payment",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text("Choose you suitable payment method",style: GoogleFonts.archivoNarrow(fontWeight:FontWeight.w400, fontSize:16, color: Colors.grey),),
          ),
          SizedBox(height:20),
          StartUpButtom(
            text: "Pay Merchant",
            color: Colors.pink,
            text_color: Colors.white,
            onTap:null,
          ),
          StartUpButtom(
            text: "Pay Merchant with QR code",
            color: red,
            text_color: Colors.white,
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> QrCodeScanner())),
          ),
          StartUpButtom(
            text: "Send Money to a friend",
            color: Colors.white,
            text_color: blue,
            onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListFriends(settings: widget.settings,))),
          ),

        ],

      ),

    );
  }
}
