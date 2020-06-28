import 'dart:async';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/api/messaging/chats_models.dart';
import 'package:repay/api/messaging/message_api.dart';
import 'package:repay/api/messaging/user_chats.dart';
import 'package:repay/components/messaging/list_chats.dart';
import 'package:repay/components/messaging/messaging_text_field.dart';
import 'package:repay/components/no_data.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  final String username;
  final String chat_id;
  final String user_pic;
  final MyAppSettings settings;
  ChatScreen({Key key, this.settings, this.username, this.chat_id, this.user_pic}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController message_controller = TextEditingController();
  var messages;
  String auth;
  getToken() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      auth = prefs.get('key') ?? 0;
    });

  }

  refresh_messages() async{
      setState(() {
          messages = fetchUserChats(http.Client(), widget.chat_id, auth);
        });
  
  }
  callback() async{
     var timer = Timer(Duration(seconds: 3), () async{
          refresh_messages();
      });
    timer.cancel();

  }

  @override
  void initState() {
    super.initState();
    getToken();
    refresh_messages();

  }
  @override
  Widget build(BuildContext context) {
    String chat_id = widget.chat_id;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("$base_url/media/${widget.user_pic}"),
          ),
        ),
        titleSpacing: 0,
        title: Text(widget.username, style: GoogleFonts.josefinSans(fontSize: 16,fontWeight: FontWeight.w600),),
      ),
      body: Column(
        children: <Widget>[
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: FutureBuilder(
                 future: messages,
                 builder: (context, snapshot){
                   if(snapshot.hasData){
                     if(snapshot.data.length == 0){
                       return Center(child: NoData());
                     }else{
                       return ListChats(
                           username: widget.settings.username.getValue(),
                           data: snapshot.data);
                     }
                   }else if(snapshot.hasError){
                     return Center(child: Text(snapshot.error.toString()));
                   }
                   return Center(child: CircularProgressIndicator(strokeWidth: 0.5,backgroundColor: Colors.white, valueColor:  AlwaysStoppedAnimation<Color>(blue),));
                 },
             ),
           ),
         ),
         Container(
           decoration: BoxDecoration(
             border: Border(top: BorderSide(color: Colors.grey[100]))
           ),
           child: Column(
             children: <Widget>[
               SizedBox(height: 10,),
               Row(
                 children: <Widget>[
                   MessagingTextField(
                     controller: message_controller,
                   ),
                   IconButton(icon: Icon(Icons.send, color: Colors.grey,), onPressed: () async{
                      String code = await send_message(auth, chat_id, message_controller.text, widget.username);
                      print(code);
                      if (code == "0"){
                        message_controller.clear();
                        refresh_messages();
                      }
                   }),
                   IconButton(icon: Icon(Icons.account_balance_wallet, color: Colors.grey,), onPressed: (){

                   }),

                 ],
               ),
             ],
           ),
         )
        ],
      ),
    );
  }

@override
  void dispose() {
    super.dispose();
    callback();
  }
}

