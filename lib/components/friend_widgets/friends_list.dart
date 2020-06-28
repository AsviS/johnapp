import 'package:flutter/material.dart';
import 'package:repay/api/messaging/chats_models.dart';
import 'package:repay/components/friend_widgets/friend_widget.dart';
import 'package:repay/api/accounts/connection_model.dart';
import 'package:repay/screens/account_screens/chat_screen.dart';
import 'package:repay/utils/settings_helper.dart';

class FriendsList extends StatelessWidget {
  final List<ChatModel> data;
  final MyAppSettings settings;
  const FriendsList({Key key, this.data, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          return FriendWidget(
            onTap:() {
              print("clicked");
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatScreen(
                username: data[index].username,
                user_pic: data[index].user_pic,
                chat_id: data[index].chat_id,
                settings: settings,)));
              },
            profile_image: data[index].user_pic,
            username: data[index].username,
            last_message: data[index].last_message,
            date: data[index].date,
          );
        });
  }
}
