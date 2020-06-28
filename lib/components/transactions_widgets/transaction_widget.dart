import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/theme/colors.dart';

class TransactionWidget extends StatelessWidget {
  final String amount;
  final String type;
  final String date;
  final String deduction;

  TransactionWidget({Key key, this.amount, this.type, this.date,this.deduction}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey[300].withOpacity(0.5),width: 0.5),bottom: BorderSide(color:  Colors.grey[300].withOpacity(0.5),width: 0.5),)

        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: deduction == "true"?Colors.red.withOpacity(0.3) : Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(getTypeImage(type)),fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(type, style: GoogleFonts.archivoNarrow(fontSize: 15, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5,),
                  Text(date, style: GoogleFonts.archivoNarrow(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(deduction == "true" ? "-$amount" : "+$amount", style: GoogleFonts.archivoNarrow(fontSize: 15, fontWeight: FontWeight.w400, color:deduction == "true" ? Colors.red: Colors.green)),
            ),
            SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}

String getTypeImage(String type){
  if (type == "Deposit"){
    return "assets/icons/money_received.png";
  }else if(type == "Send"){
    return "assets/icons/money_sent.png";
  }else if(type == "Received"){
    return "assets/icons/money_received.png";
  }else if(type == "Payment"){
    return "assets/icons/merchant.png";
  }
}