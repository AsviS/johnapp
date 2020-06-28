import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/theme/colors.dart';


class ChipTrend extends StatelessWidget {
  final String amount;
  final IconData icon;
  final String type;

  const ChipTrend({Key key, this.amount, this.icon, this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width:10),
            Text(type == "earn" ? "ksh + $amount" : "ksh - $amount",style: GoogleFonts.archivoNarrow(fontSize: 12,color: type == "earn" ? Colors.green : red),)
        ],),
      ),
    );
  }
}
