import 'dart:async';

import 'package:flutter/material.dart';
import 'package:repay/pages/home.dart';
import 'package:repay/screens/startapp/startapp.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  final MyAppSettings settings;

  SplashScreen({Key key, this.settings}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () async{
      final prefs = await SharedPreferences.getInstance();

      final key = prefs.get('key') ?? "0";
      if (key == "0"){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> StartApp(settings: widget.settings,)));
      }else{
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(settings: widget.settings,)));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(image: AssetImage("assets/images/repay_logo.png"))
            ),
          ),
        )  
      ],),
    );
  }
}