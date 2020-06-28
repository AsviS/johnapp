import 'package:flutter/material.dart';
import 'package:repay/components/no_data.dart';
import 'package:repay/components/notification_widgets/notification_list.dart';
import 'package:repay/api/accounts/notification_model.dart';
import 'package:http/http.dart' as http;
import 'package:repay/theme/colors.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScreenNotification extends StatefulWidget {
  final MyAppSettings settings;
  ScreenNotification({Key key, this.settings}) : super(key: key);

  @override
  _ScreenNotificationState createState() => _ScreenNotificationState();
}

class _ScreenNotificationState extends State<ScreenNotification> {
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
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            FutureBuilder(
                future: fetchNotifications(http.Client(), key),
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    widget.settings.unread.setValue(snapshot.data.length.toString());
                    if(snapshot.data.length == 0){
                      return NoData();
                    }else{
                      return NotificationList(
                        data: snapshot.data,
                    );}
                  } else if(snapshot.hasError){
                    return Center(
                      child: Text("${snapshot.error.toString()}"),
                    );
                  }
                  return Center(child: CircularProgressIndicator(backgroundColor: Colors.white, strokeWidth: 0.5, valueColor: AlwaysStoppedAnimation<Color>(blue)));
                })

          ],),
        ),
      
    );
  }
}