import 'dart:ui';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:repay/anim/FadeAnimation.dart';
import 'package:repay/components/custom_button.dart';
import 'package:repay/components/menu_item.dart';
import 'package:repay/screens/card_screens/add_card.dart';
import 'package:repay/screens/request_screens/payment_options.dart';
import 'package:repay/screens/screen_card.dart';
import 'package:repay/screens/screen_analytics.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/utils/settings_helper.dart';

class ScreenHome extends StatefulWidget {
  final MyAppSettings settings;
  ScreenHome({Key key, this.settings}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  choices_screen choosed = choices_screen.home;
  dialog_choice d_choice =dialog_choice.close;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Stack(
      children: <Widget>[
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: <Widget>[
          ScreenCard(setting: widget.settings,),
          ScreenAnalytics()
        ],),
        Visibility(
          visible: d_choice == dialog_choice.close ? false :true,
          child: Positioned.fill(
              child: AnimatedOpacity(
                opacity: d_choice == dialog_choice.close ?0.0 : 1,
                duration: Duration(seconds: 10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(

                    child: Column(
                      children: <Widget>[
                        Expanded(child: SizedBox()),
                        FadeAnimation(
                          1,
                          StartUpButtom(
                            radius: 50,
                            width: 200,
                            text: "Add Card",
                            color: blue,
                            text_color: Colors.white,
                            onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddCard())),
                          ),
                        ),
                        FadeAnimation(
                          1, StartUpButtom(
                            radius: 50,
                            width: 200,
                            text: "Make Payment request",
                            color: blue,
                            text_color: Colors.white,
                            onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PaymentOptions(settings: widget.settings,))),
                          ),
                        ),
                        SizedBox(height: 40,)
                      ],
                    ),
                  ),
                ),
              )
          ),
        )
      ],
    ),
    bottomNavigationBar: BottomAppBar(
        notchMargin: 4,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Expanded(child: NavItem(
              icon_color:  choosed == choices_screen.home ? blue : Colors.grey[500],
              icon: FeatherIcons.home,
              text: "Home",
              onPress: (){
               controller.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                setState(() {
                  choosed = choices_screen.home;
                });
              },
              )),
            Expanded(child: NavItem(
              icon: FeatherIcons.activity,
              text: "Transactions",
              icon_color:  choosed == choices_screen.send ? blue : Colors.grey[500],
              onPress: (){
               controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);

                setState(() {
                  choosed = choices_screen.send;
                });
                },
              )),
          ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blue,
        child:d_choice == dialog_choice.close? Icon(FeatherIcons.plus):Icon(FeatherIcons.x),
        onPressed: (){
          if(d_choice == dialog_choice.close){
            setState(() {
              d_choice = dialog_choice.open;
            });
          }else{
            setState(() {
              d_choice = dialog_choice.close;
            });
          }
        }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

enum choices_screen{
  home,
  send
}

enum dialog_choice {
  open,
  close
}