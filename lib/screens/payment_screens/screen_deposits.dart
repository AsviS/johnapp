import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:repay/api/client.dart';
import 'package:repay/components/container_transaction.dart';
import 'package:repay/components/no_data.dart';
import 'package:repay/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenDeposits extends StatefulWidget {
  @override
  _ScreenDepositsState createState() => _ScreenDepositsState();
}

class _ScreenDepositsState extends State<ScreenDeposits> {
  String key = "";
  getToken() async{
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      key = prefs.get('key') ?? 0;
    });

  }
  @override
  void initState() {
    super.initState();

    getToken();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_deposit_transactions(key),
      builder: (context, snapshot){
        Map data = snapshot.data;
         if(snapshot.hasData){
           if(data['size'] == 0){
            return Center(child: NoData());
           }else {
             return  ListView.builder(
              itemCount: data['size'], 
              itemBuilder: (context, index){
                 return ContainerTransaction(
                   gateway: data['list'][index]['gateway'],
                   amount:data['list'][index]['amount'],
                   date:data['list'][index]['date'],
                   type: "deposit",

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
      );
  }
}