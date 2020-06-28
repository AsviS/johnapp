import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/components/client_widgets/chip_trend.dart';

class ClientCard extends StatelessWidget {
  final String amount;
  final String spent;
  final String earned;

  const ClientCard({Key key, this.amount, this.spent, this.earned}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width:double.infinity,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color:Colors.grey[200])
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: SizedBox()),

                Padding(
                padding: const EdgeInsets.only(left:0.0,top:20,bottom: 10),
                child: Text("Your Balance",style: GoogleFonts.archivoNarrow(color:Colors.grey, fontSize:12, fontWeight:FontWeight.w400),),
              ),
                Text("Ksh $amount",style: GoogleFonts.josefinSans(color:Colors.black, fontSize:40, fontWeight:FontWeight.w600),),
              Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text("Today money analysis",style: GoogleFonts.archivoNarrow(color:Colors.grey, fontSize:12, fontWeight:FontWeight.w400),),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: ChipTrend(
                        type: "earn",
                        icon: FeatherIcons.trendingUp,
                        amount: earned,
                      )), 
                      SizedBox(width:10), 
                      Expanded(child: ChipTrend(
                        type: "lose",
                        icon: FeatherIcons.trendingDown,
                        amount: spent,
                      ))
                  ],
                  ),
                ),
              )
            ],
            ),
          ),
        );
  }
}