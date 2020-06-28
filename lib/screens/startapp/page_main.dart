import 'package:flutter/material.dart';
import 'package:repay/pages/home.dart';
import 'package:repay/screens/account_screens/screen_profile.dart';

class PageMain extends StatefulWidget {
  PageMain({Key key}) : super(key: key);

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: PageController(
        initialPage: 1
      ),
      children: <Widget>[
        ScreenProfile(),
        Home()
      ],
    );
  }
}