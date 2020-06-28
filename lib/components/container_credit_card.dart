import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/components/container_text.dart';
import 'package:repay/theme/colors.dart';

class ContainerCreditCard extends StatelessWidget {
  final String card_holder_name;
  final String card_type;

  const ContainerCreditCard({Key key, this.card_holder_name, this.card_type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: width,
        decoration: BoxDecoration(
            color: blue.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("03/19",style: GoogleFonts.archivoNarrow(fontSize: 15,color: Colors.white),),
                  Expanded(child: SizedBox()),
                  Icon(card_type == "visa" ? FontAwesomeIcons.ccVisa:FontAwesomeIcons.ccMastercard, color: Colors.white,)
                ],
              ),
              Expanded(child: SizedBox()),
              Text("Card holder",style: GoogleFonts.archivoNarrow(fontSize: 10,color: Colors.white)),
              SizedBox(height: 3,),
              Text(card_holder_name,style: GoogleFonts.archivoNarrow(fontSize: 15,color: Colors.white),),
              SizedBox(height: 10,),
              Text("Card Number",style: GoogleFonts.archivoNarrow(fontSize: 10,color: Colors.white)),
              SizedBox(height: 3,),
              Text("1234 5678 4356 7742",style: GoogleFonts.archivoNarrow(fontSize: 15,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}

