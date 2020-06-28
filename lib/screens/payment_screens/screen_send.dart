import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:repay/api/client.dart';
import 'package:repay/components/container_transaction.dart';
import 'package:repay/components/no_data.dart';
import 'package:repay/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSend extends StatefulWidget {
  @override
  _ScreenSendState createState() => _ScreenSendState();
}

class _ScreenSendState extends State<ScreenSend> {
  String key = "";
  getToken() async{
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      key = prefs.get('key') ?? "0";
    });

  }

  @override
  void initState() {
    super.initState();  
    getToken();
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body :FutureBuilder(
      future: get_send_transactions(key),
      builder: (context, snapshot){
        Map data = snapshot.data;
        print(key);
         if(snapshot.hasData){
           if(data['size'] == 0){
            return Center(child: NoData());
           }else {
             return  ListView.builder(
              itemCount: data['size'], 
              itemBuilder: (context, index){
                         return CardSend(
                   amount:data['list'][index]['amount'],
                   date:data['list'][index]['date'],
                   transaction: data['list'][index]['transaction'],
                   sender_username: data['list'][index]['sender_username'],
                   receiver_username: data['list'][index]['receiver_username'],
                 );
              }
              );
           }
         }else if(snapshot.hasError){
           return Center(child: Container(
             height: 200,
             width: 200,
             child: Column(
               children: <Widget>[
                 Container(
                   height: 100,
                   width: 100,
                   decoration: BoxDecoration(
                     image:DecorationImage(image: AssetImage("assets/images/no_data.png"))
                   ),
                 ),
                 Text(snapshot.error.toString()),
               ],
             ),
           ));
         }

         return Center(child: CircularProgressIndicator(backgroundColor: Colors.white, strokeWidth: 0.5, valueColor: AlwaysStoppedAnimation<Color>(blue)));
      }
      ));
  }
}

class CardSend extends StatelessWidget {
  final String amount;
  final String date;
  final String transaction;
  final String receiver_username;
  final String sender_username;

  const CardSend({Key key, this.amount, this.date, this.transaction, this.receiver_username, this.sender_username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
         width : double.infinity,
         decoration: BoxDecoration(
           color: Colors.white,
           border: Border(top: BorderSide(color: Colors.grey[300].withOpacity(0.5),width: 0.5),bottom: BorderSide(color:  Colors.grey[300].withOpacity(0.5),width: 0.5),)
         ),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text("Ksh " + amount, style: GoogleFonts.archivoNarrow(color:Colors.black, fontSize:15, fontWeight:FontWeight.w600),),
                  SizedBox(height: 5,),
                  Text("Sent on: "+date,style: TextStyle(fontSize: 10, color:Colors.grey, ),),

                ],),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: transaction == "send" ? Text("Sent to: " + receiver_username.toLowerCase(),style :GoogleFonts.archivoNarrow(fontSize:12, color:Colors.grey)) : Text("Sent by:"+ sender_username.toLowerCase() , style: TextStyle(fontSize:12, color:Colors.grey),),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 22,
                      decoration: BoxDecoration(
                        color: transaction == "send" ? red :Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: Text(transaction,style: GoogleFonts.archivoNarrow(color:Colors.white, fontSize:8,fontWeight:FontWeight.w300),)),
                      ),
                    ),
                  ),
                ],
              )
           ],),
       ),
     );
  }
}