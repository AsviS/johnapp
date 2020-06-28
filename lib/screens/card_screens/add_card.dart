import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/screens/card_screens/container_edit_text.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {

  card_Selected card_selector = card_Selected.visa;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(icon: Icon(FeatherIcons.chevronLeft, color: Colors.grey[800],), onPressed: ()=> Navigator.of(context).pop()),
        title: Text("Add Card",style: GoogleFonts.archivoNarrow(fontSize: 20,color: Colors.grey[600])),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Text("Please enter valid card info",style: GoogleFonts.archivoNarrow(fontSize: 15,color: Colors.grey)),
            SizedBox(height: 5,),


            //Choosing caeds
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CardTypeSelector(
                      icon: FontAwesomeIcons.ccVisa,
                      isChosen: card_selector == card_Selected.visa ? true : false,
                      onpress: (){
                        setState(() {
                          card_selector = card_Selected.visa;
                        });
                      },
                    ),
                    SizedBox(width: 4,),
                    CardTypeSelector(
                      icon: FontAwesomeIcons.ccMastercard,
                      isChosen: card_selector == card_Selected.mastercard ? true : false,
                      onpress: (){
                        setState(() {
                          card_selector = card_Selected.mastercard;
                        });
                      },
                    )
                  ],
                ),
            ),
            ContainerEditText(
              hint: "Card Holder",
            ),
            ContainerEditText(
              hint: "Card Number",
            ),
            ContainerEditText(
              hint: "Expiry date",
            ),
            ContainerEditText(
              hint: "CVV",
            ),
           StartUpButtom(
             text: "Save",
             text_color: Colors.white,
             color: blue,
           )
          ],
        ),
      ),
    );
  }
}

class CardTypeSelector extends StatelessWidget {
  final IconData icon;
  final Function onpress;
  final bool isChosen;

  const CardTypeSelector({Key key ,this.onpress, this.isChosen, this.icon}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300])
        ),
        child: Center(
          child: Icon(icon, color: isChosen == true ?  blue.withOpacity(0.5): Colors.grey[300],),
        ),
      ),
    );
  }
}

enum card_Selected {
  visa,
  mastercard
}