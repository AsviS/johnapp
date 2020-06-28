import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerTransaction extends StatelessWidget {
  final String amount;
  final String date;
  final String type;
  final String gateway;

  ContainerTransaction({this.amount, this.date, this.type, this.gateway});
  @override
  Widget build(BuildContext context) {
    return Padding(
             padding: const EdgeInsets.all(0.0),
             child: Container(
               height:80,
               width:double.infinity,
               decoration:BoxDecoration(
                 color:Colors.white,
                   border: Border(top: BorderSide(color: Colors.grey[300].withOpacity(0.5),width: 0.5),bottom: BorderSide(color:  Colors.grey[300].withOpacity(0.5),width: 0.5),)

               ),
               child: Row(                            
                 children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height:50,
                      width:50,
                      decoration:BoxDecoration(
                        shape:BoxShape.circle,
                        color: gateway == "mpesa" ? Colors.green  : Colors.blue
                      ),
                      child: Center(
                        child: Text('${gateway[0].toUpperCase()}', style: GoogleFonts.archivoNarrow(color: Colors.white),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text("Ksh $amount",style: GoogleFonts.archivoNarrow(color:Colors.black, fontSize:15, fontWeight:FontWeight.w400),),
                        SizedBox(height: 5,),
                        Text(date,style: GoogleFonts.archivoNarrow(color:Colors.grey, fontSize:12, fontWeight:FontWeight.w400),),
                      ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      type == "deposit" ? FeatherIcons.trendingUp : FeatherIcons.trendingDown,
                      color: type == "deposit" ? Colors.green: Colors.red,
                      ),
                  ),
             
               ],),
             ),
           );
  }
}