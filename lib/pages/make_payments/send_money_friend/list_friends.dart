import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/components/friend_components/friend_gridview.dart';
import 'package:repay/components/friend_widgets/friends_list.dart';
import 'package:repay/api/accounts/connection_model.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ListFriends extends StatefulWidget {
  final MyAppSettings settings;
  final bool messaging;
  ListFriends({Key key, this.messaging, this.settings}) : super(key: key);

  @override
  _ListFriendsState createState() => _ListFriendsState();
}

class _ListFriendsState extends State<ListFriends> {

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(icon: Icon(FeatherIcons.x), onPressed: ()=>Navigator.of(context).pop()),
        title: Text("Choose the friend",style: GoogleFonts.archivoNarrow(),),
      ),
      body:  FutureBuilder(
        future: fetchConnections(http.Client(), key),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return FriendGridview(
              messaging: widget.messaging,
              settings: widget.settings,
                data: snapshot.data);
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator(strokeWidth: 0.5,backgroundColor: Colors.white, valueColor:  AlwaysStoppedAnimation<Color>(blue),));
        },
      ),
    );
  }
}