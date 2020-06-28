import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:repay/api/client.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/components/client_widgets/client_card.dart';
import 'package:repay/components/client_widgets/service_holder.dart';
import 'package:repay/components/custom_button.dart';
import 'package:repay/pages/page_deposit.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenCard extends StatefulWidget {
  final MyAppSettings setting;
  ScreenCard({Key key, this.setting}) : super(key: key);

  @override
  _ScreenCardState createState() => _ScreenCardState();
}

class _ScreenCardState extends State<ScreenCard> {
  
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
    double height =MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Container(
                height: (height/2) - 60,
                child: FutureBuilder(
                  future: client(key),
                  builder: (context,snapshot){
                    if (snapshot.hasData){
                      Map data = snapshot.data;

                      return ClientCard(
                        amount: data['balance'],
                        spent: data['spent'],
                        earned:data['earn']
                      );

                    }else if(snapshot.hasError){
                      return Container(
                        height: 180,
                          child: Center(child: Text(snapshot.error.toString())));
                    }
                    return Container(
                        height: 180,
                        child: Center(child: CircularProgressIndicator(strokeWidth: 0.5,backgroundColor: Colors.white, valueColor:  AlwaysStoppedAnimation<Color>(blue),)));
                  }
                  ),
              ),
             Row(
               children: <Widget>[
                Expanded(
                  child: CustomButton(
                    color: blue,
                    t_color: Colors.white,
                    text: "Deposit",
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PageDeposit())),
                  )
                ),
                Expanded(
                  child: CustomButton(
                    color: blue,
                    t_color: Colors.white,
                    text: "Withdraw",
                  ),
                ),
             ],
             ),
             ServiceHolder()

            ],
            ),
        ),
    );
  }
}

