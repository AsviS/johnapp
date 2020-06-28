import 'package:flutter/material.dart';
import 'package:repay/api/messaging/user_chats.dart';
import 'package:repay/components/messaging/chat_widget.dart';

class ListChats extends StatelessWidget {
  final List<UserChats> data;
  final String username;

  const ListChats({Key key, this.data, this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          return ChatWidget(
            message: data[index].message,
            receiver:data[index].receiver_username ,
            sender: data[index].sender_username,
            username: username,
          );
        }
    );
  }
}
