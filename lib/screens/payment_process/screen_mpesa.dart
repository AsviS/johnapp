import 'dart:convert';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repay/api/wallet.dart';
import 'package:repay/components/container_text_input.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/screens/startapp/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';


class ScreenMpesa extends StatefulWidget {
  @override
  _ScreenMpesaState createState() => _ScreenMpesaState();
}

class _ScreenMpesaState extends State<ScreenMpesa> {
  TextEditingController phone_number = TextEditingController();
  TextEditingController amount = TextEditingController();
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
            child: Text("Lipa na mpesa",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text("Please make sure you have entered a valid safaricom phone number",style: TextStyle(fontWeight:FontWeight.w400, fontSize:16, color: Colors.grey),textAlign: TextAlign.center,),
          ),
          SizedBox(height: 20,),
          ContainerTextInput(
            controller: phone_number,
            icon: FeatherIcons.phone,
            radius: 10,
            hint: "Phone Number",
            number_keyboard: true,
          ),
          ContainerTextInput(
            controller: amount,
            icon: FeatherIcons.dollarSign,
            radius: 10,
            hint: "Amount",
            number_keyboard: true,
          ),
          SizedBox(height:20),
          StartUpButtom(
            text: "Finish",
            color: Colors.white,
            text_color: Colors.green,
            onTap: () async{
              String n = phone_number.text.toString();
              if(n.length == 10){
                String user_phonenumber = "254${n[1]}${n[2]}${n[3]}${n[4]}${n[5]}${n[6]}${n[7]}${n[8]}${n[9]}";
                print(user_phonenumber+ "and" + amount.text);
                showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                    barrierColor: Colors.black45,
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (BuildContext buildContext,
                        Animation animation,
                        Animation secondaryAnimation) {
                      return LoadingScreen(
                        text: "Payment request being requested",
                        sub: "Welcome back we're happy to serve you",
                      );
                    });
                var message = await depositMpesa(key, amount.text, user_phonenumber);
                var json_encode = json.decode(message);
                print(json_encode);
                if (json_encode['ResultCode'] == "0"){
                  Navigator.of(context).pop();
                  Toast.show("The transaction was successfully processed", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                }else{
                  Navigator.of(context).pop();
                  Toast.show("There is an error ", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                }
            }},
          ),
        ],
      ),
    );
  }
}