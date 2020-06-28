import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/theme/colors.dart';

class ChatWidget extends StatelessWidget {
  final String message;
  final String receiver;
  final String sender;
  final String username;

  const ChatWidget({Key key, this.message, this.receiver, this.sender, this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:width,
        child: Row(
          children: <Widget>[
            getSizedBox(username, receiver, sender),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: get_user(username, receiver, sender) == "ou" ?Radius.circular(0): Radius.circular(20),
                  bottomRight: get_user(username, receiver, sender) == "cu" ?Radius.circular(0): Radius.circular(20)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(message,style: GoogleFonts.archivoNarrow(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15),),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget getSizedBox(username, receiver, sender){
  if (username == receiver){
    return SizedBox();
  }else if(username == sender){
    return SizedBox();
  }else{
    return Expanded(child: SizedBox());;
  }
}

String get_user(username, receiver, sender){
  if (username == receiver){
    return "ou";
  }else if(username == sender){
    return "ou";
  }else{
    return "cu";
  }
}