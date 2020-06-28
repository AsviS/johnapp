import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/theme/colors.dart';


class ServiceCard extends StatelessWidget {
  IconData icon;
  String text;
  
  ServiceCard({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:4.0,top: 8),
      child: Container(
          decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color:Colors.grey[200])
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:18.0,bottom: 8),
                  child: Icon(icon == null ? FeatherIcons.creditCard : icon, color: blue, size: 25,),
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text == null ? "Pay Goods and Services" : text,style:GoogleFonts.archivoNarrow(fontWeight:FontWeight.w400, fontSize:12, color:Colors.grey),textAlign: TextAlign.center,),
                ))
              
              ],
            ),
      ),
    );
  }
}