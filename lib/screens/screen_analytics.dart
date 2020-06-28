import 'package:flutter/material.dart';
import 'package:repay/components/no_data.dart';
import 'package:repay/components/transactions_widgets/list_transaction.dart';
import 'package:repay/api/wallet/transaction_model.dart';
import 'package:http/http.dart' as http;
import 'package:repay/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ScreenAnalytics extends StatefulWidget {
  @override
  _ScreenAnalyticsState createState() => _ScreenAnalyticsState();
}

class _ScreenAnalyticsState extends State<ScreenAnalytics> {
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
    print("This is the key $key");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
          FutureBuilder(
            future: fetchTransactions(http.Client(), key),
              builder: (context, snapshot){
              if (snapshot.hasData){
                if (snapshot.data.length == 0){
                  return Center(child: NoData());
                }else{
                  return ListTransaction(
                    data: snapshot.data,
                  );
                }
              }else if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error),
                );
              }
              return Center(child: CircularProgressIndicator(strokeWidth: 0.5,backgroundColor: Colors.white, valueColor:  AlwaysStoppedAnimation<Color>(blue),));

              })
          ],
        ),
      )
    );
  }
}
