import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/api/client.dart';
import 'package:repay/api/wallet.dart';
import 'package:repay/pages/home.dart';
import 'package:repay/screens/card_screens/container_edit_text.dart';
import 'package:repay/screens/startapp/loading_screen.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class PayFriend extends StatefulWidget {
  final String phone_number;
  final String image;
  PayFriend({Key key, this.phone_number, this.image}) : super(key: key);

  @override
  _PayFriendState createState() => _PayFriendState();
}

class _PayFriendState extends State<PayFriend> {
  TextEditingController amount_controller = TextEditingController();
  TextEditingController pin_controller = TextEditingController();

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
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(icon: Icon(FeatherIcons.x), onPressed: ()=>Navigator.of(context).pop()),
        title: Text("",style: GoogleFonts.archivoNarrow(),),
      ),
      body:   SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover)
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Enter the Amount",style: GoogleFonts.archivoNarrow(),),
            ContainerEditText(
              controller: amount_controller,
              hint: "Amount",
              center: true,
              number: true,
            ),
            SizedBox(height: 20,),
            Text("Enter the Pin",style: GoogleFonts.archivoNarrow(),),
            ContainerEditText(
              controller: pin_controller,
              hint: "Pin",
              center: true,
              number: true,
            ),
            StartUpButtom(
              color: blue,
              text_color: Colors.white,
              text: "Pay Now",
              onTap: () async{


              if (amount_controller.text == "" ){
                  Toast.show("Please enter the credentials correctly", context, duration: 3, gravity:  Toast.BOTTOM);
              }else if(pin_controller.text == ""){
                Toast.show("Please enter the credentials correctly", context, duration: 3, gravity:  Toast.BOTTOM);
              }else{
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
                          text: "Sending money",
                          sub: "Send money to friend and families",
                        );
                      });
                  var message =  await send_pesa(key, amount_controller.text, widget.phone_number,pin_controller.text);
                  if(message == "0"){
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Toast.show("Payment was successful", context, duration: 5, gravity:  Toast.BOTTOM);
                  }else if(message == "1"){
                    Navigator.of(context).pop();
                    Toast.show("Something went wrong", context, duration: 5, gravity: Toast.BOTTOM);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}