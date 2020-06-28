import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:repay/utils/constants.dart';

Future<String> signup(String username,String fullname,String email, String phone_number, String country, String password) async{
  var json_body =jsonEncode(<String, String>{
    "username":username,
    "full_names":fullname,
    "email_address":email,
    "phone_number":phone_number,
    "country":country,
    "password":password
  });
  var response =await http.post(
      "$base_url/sign_up",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json_body);
  String response_body = response.body;
  var json_encode = json.decode(response_body);
  return json_encode['message'];

}

Future<String> log_in(String phone_number, String password) async{
  var json_body = jsonEncode(<String,String>{
    "phone_number":phone_number,
    "password":password
  });
  var response = await http.post(
    base_url + "/log_in",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json_body
  );
  String response_body = response.body;
  var json_encode = json.decode(response_body);
  return json_encode['access_token'];
}

Future<String> log_out(String key, String password) async{
  var json_body = jsonEncode(<String,String>{
    "key":key
  });
  var response = await http.post(
      base_url + "/log_out",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json_body
  );
  String response_body = response.body;
  var json_encode = json.decode(response_body);
  return json_encode['message'];
}

