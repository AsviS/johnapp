import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:repay/utils/constants.dart';

class UserChats{
  final String chat_id;
  final String message;
  final String sender_username;
  final String receiver_username;

  UserChats({this.chat_id, this.message, this.sender_username, this.receiver_username});

  factory UserChats.fromJson(Map <String, dynamic> json){
    return UserChats(
      chat_id: json['chat_id'],
      message: json['message'],
      sender_username: json['sender_username'],
      receiver_username: json['receiver_username']
    );
  }
}
List<UserChats> parseUserChats(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<UserChats>((json) => UserChats.fromJson(json)).toList();
}


Future<List<UserChats>> fetchUserChats(http.Client client,String key,String auth) async {
  final response = await client.get(base_url + '/get_chats',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key,
      'Authorizations':auth,
    },);
  print(response.body.toString());
  return compute(parseUserChats, response.body);
}

//{
//"id": 6,
//"chat_id": "t3ywye",
//"message": "The is the message from Test 3",
//"image": "",
//"sender_username": "john254",
//"receiver_username": "ivy",
//"party_a_blocked": false,
//"party_b_blocked": false,
//"date": "2020-06-15",
//"time": "13:01:00"
//},
