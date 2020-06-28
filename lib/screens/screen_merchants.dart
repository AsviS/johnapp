import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/components/fab_widgets/fab_item.dart';
import 'package:repay/components/fab_widgets/fab_menu.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';

class ScreenMerchants extends StatefulWidget {
  final MyAppSettings settings;
  ScreenMerchants({Key key, this.settings}) : super(key: key);

  @override
  _ScreenMerchantsState createState() => _ScreenMerchantsState();
}

class _ScreenMerchantsState extends State<ScreenMerchants> {
    choices choose = choices.close;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: <Widget>[
            Positioned.fill(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FabMenu(
              visible:choose == choices.close ? false : true,
              onpress: (){
                setState(() {
                  if (choose == choices.close){
                    choose = choices.open;
                  }else{
                    choose = choices.close;
                  }
                });
              },
              children: <Widget>[
                FabItem(
                  icon: FeatherIcons.creditCard,
                  text: "Payment requests ",
                  onpress: null,
                ),
                
                FabItem(
                  icon: Icons.inbox,
                  text: "Invoices",
                  onpress: null
                   ),
                FabItem(
                  icon: Icons.directions,
                  text: "Merchants near you",
                  onpress: null
                   ), 
              ],
            ),
          ))
       ],
     ),
    );
  }
}
enum choices{
  open,
  close
}