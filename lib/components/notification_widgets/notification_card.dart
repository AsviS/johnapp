import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/screens/request_screens/payment_request.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/notification_utils.dart';
import 'package:repay/utils/screen_utils.dart';

class NotificationCard extends StatelessWidget {
  final int id;
  final String sender;
  final String request;
  final String sub;
  final String date;
  final String notification_status;

  const NotificationCard({Key key, this.sender, this.request, this.sub, this.date, this.notification_status, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () async{
//        String message = await read_nofication(id);
//        print(id);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> notification_clicker(request)));
        },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color: notification_status == "unread"? light_white:Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 2
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,left: 15,bottom: 8, right: 10),
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color: blue
                  ),
                  child: Center(
                    child:Text("${sender[0]}",style: GoogleFonts.josefinSans(fontSize:15, color: Colors.white, fontWeight: FontWeight.w600)),

                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(child: SizedBox()),
                        Text(request,style: GoogleFonts.josefinSans(fontSize:15, color: Colors.black, fontWeight: FontWeight.w600)),
                        SizedBox(height: 5,),
                        Text(sub ,style: GoogleFonts.josefinSans(fontSize:12, color: Colors.grey, fontWeight: FontWeight.w300),),
                        Expanded(child: SizedBox()),
                        Text(date ,style: GoogleFonts.josefinSans(fontSize:10, color: Colors.grey, fontWeight: FontWeight.w600),),
                      ],),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
