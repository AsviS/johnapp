import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:repay/utils/settings_helper.dart';
import 'package:http/http.dart' as http;
import 'package:repay/utils/constants.dart';

Future<Map> client(key) async{
  var response = await http.get(
    base_url+"/get_client",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key
    },
  );
  String response_body = response.body;
  var data = json.decode(response_body);
  
  save_client_info(data['phone_number'], data['profile_image'], data['full_name'], data['country'], data['balance'], data['user_name']);
  return data;
}

Future<Map> get_deposit_transactions(key) async{
  var response = await http.get(
    base_url+"/deposit_transactions",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key
    },
  );
  String response_body = response.body;
  var data = json.decode(response_body);

  return data;
}

Future<Map> get_send_transactions(key) async{
  var response = await http.get(
    base_url+"/send_transactions",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key
    },
  );
  String response_body = response.body;
  var data = json.decode(response_body);
  return data;
}


Future<Map> all_friends() async{
  var response = await http.get(
    base_url+"/users",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  String response_body = response.body;
  var data = json.decode(response_body);
  return data;
}


