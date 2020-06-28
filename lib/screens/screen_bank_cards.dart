import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:repay/components/container_credit_card.dart';
import 'package:repay/components/container_text.dart';
import 'package:repay/models/card_model.dart';
import 'package:repay/theme/colors.dart';

class ScreenBankCards extends StatefulWidget {
  @override
  _ScreenBankCardsState createState() => _ScreenBankCardsState();
}

class _ScreenBankCardsState extends State<ScreenBankCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: list_cards.length,
        itemBuilder: (context,index){
          return Column(children: <Widget>[
           ContainerCreditCard(
             card_holder_name: list_cards[index].card_holder,
             card_type: list_cards[index].type,
           ),

          ],);
        }
        ),   
      floatingActionButton: FloatingActionButton(
        child: Center(child:Icon(FeatherIcons.plus,)),
        elevation: 0.5,
        backgroundColor: blue,
        onPressed: null
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,  
    );
  }
}