import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repay/api/messaging/chats_models.dart';
import 'package:repay/components/fab_widgets/fab_item.dart';
import 'package:repay/components/fab_widgets/fab_menu.dart';
import 'package:repay/components/friend_components/friend_gridview.dart';
import 'package:repay/components/friend_widgets/friends_list.dart';
import 'package:repay/components/menu_item.dart';
import 'package:repay/components/no_data.dart';
import 'package:repay/api/accounts/connection_model.dart';
import 'package:http/http.dart' as http;
import 'package:repay/pages/friend_pages/find_friends.dart';
import 'package:repay/pages/make_payments/send_money_friend/list_friends.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenFriend extends StatefulWidget {
  final MyAppSettings settings;

  const ScreenFriend({Key key, this.settings}) : super(key: key);
  @override
  _ScreenFriendState createState() => _ScreenFriendState();
}

class _ScreenFriendState extends State<ScreenFriend> {
  choices choose = choices.close;
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
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: FutureBuilder(
                  future: fetchChats(http.Client(), key),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      if(snapshot.data.length == 0){
                        return Center(child: NoData());
                      }else{
                        return FriendsList(
                          settings: widget.settings,
                            data: snapshot.data);
                      }
                    }else if(snapshot.hasError){
                      print(snapshot.error.toString());
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    return Center(child: CircularProgressIndicator(strokeWidth: 0.5,backgroundColor: Colors.white, valueColor:  AlwaysStoppedAnimation<Color>(blue),));
                  },
                ),
              ),
            ],
          ),
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
                  icon: FeatherIcons.messageCircle,
                  text: "Start Chat ",
                  onpress: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ListFriends(messaging: true, settings: widget.settings,))),
                ),
                FabItem(
                  icon: FeatherIcons.search,
                  text: "Find Friends ",
                  onpress: ()=>  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FindFreinds(settings: widget.settings,))),
                   ),
                FabItem(icon: FeatherIcons.link2, text: "Connection request",),
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