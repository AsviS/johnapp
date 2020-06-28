import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:repay/utils/constants.dart';


Future<String> send_message(key, chat_id,message, receiver_username) async{
  var json_body = jsonEncode(<String,String>{
    "chat_id": chat_id,
    "message": message,
    "receiver_username": receiver_username
  });
  var response = await http.post(
    base_url+"/send_message",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key
    },
    body: json_body
  );

  String response_body = response.body;
  var data = json.decode(response_body);
  return data['code'];
}

