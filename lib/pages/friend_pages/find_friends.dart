import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/api/connections/find_friend_models.dart';
import 'package:repay/pages/friend_pages/friend_holder.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; 
class FindFreinds extends StatefulWidget {
  final MyAppSettings settings;

  const FindFreinds({Key key, this.settings}) : super(key: key);
  @override
  _FindFreindsState createState() => _FindFreindsState();
}

class _FindFreindsState extends State<FindFreinds> {
  String key;
  getToken() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      key = prefs.get('key') ?? 0;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Find Friends",style: GoogleFonts.archivoNarrow()),
        titleSpacing: 0,
      ),
      body: Column(
        children: <Widget>[
          
          Expanded(
            child: FutureBuilder(
              future: fetchUsers(http.Client(), key),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  print(key);
                  return FriendHolder(
                    data:snapshot.data
                  );
                }else if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return Center(child: CircularProgressIndicator(strokeWidth: 0.5,backgroundColor: Colors.white, valueColor:  AlwaysStoppedAnimation<Color>(blue),));
              }
              )
            )
        ],
      ),
      
    );
  }
}