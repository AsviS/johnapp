import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:repay/components/friend_components/friend_gridview.dart';
import 'package:repay/api/accounts/connection_model.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/constants.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenProfile extends StatefulWidget {
  final MyAppSettings settings;

  ScreenProfile({Key key, this.settings}) : super(key: key);

  @override
  _ScreenProfileState createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: blue,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(base_url+widget.settings.profile_image.getValue()),fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(widget.settings.full_name.getValue(),style: GoogleFonts.josefinSans(fontSize: 20,fontWeight: FontWeight.w800),),
                    SizedBox(height: 10,),
                    Text("@${widget.settings.username.getValue()}",style: GoogleFonts.archivoNarrow(fontSize: 15,fontWeight: FontWeight.w400, color: Colors.grey),),
                    SizedBox(height: 20,),
                    StartUpButtom(
                      color: blue,
                      width: 200,
                      radius: 50,
                      text_color: Colors.white,
                      text: "Edit Profile",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left:27.0,bottom: 25),
                child: Text("Friends",style: GoogleFonts.josefinSans(fontSize: 20,fontWeight: FontWeight.w800),),
              ),
              Container(
                height: 200,
                child:  FutureBuilder(
                  future: fetchConnections(http.Client(), key),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return FriendGridview(
                          physic: false,
                          shrink: true,
                          data: snapshot.data);
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    return Center(child: CircularProgressIndicator(strokeWidth: 0.5,backgroundColor: Colors.white, valueColor:  AlwaysStoppedAnimation<Color>(blue),));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}