import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:repay/api/accounts/connection_model.dart';
import 'package:repay/utils/constants.dart';

class ChatModel{
  final String chat_id;
  final String username;
  final String user_pic;
  final String last_message;
  final String date;

  ChatModel({this.chat_id, this.username, this.user_pic, this.last_message, this.date});
  factory ChatModel.fromJson(Map <String, dynamic> json){
    return ChatModel(
      chat_id: json['chat_id'],
      username: json['username'],
      user_pic: json['user_pic'],
      last_message: json['last_message'],
      date: json['date']
    );
  }
}

List<ChatModel> parseChats(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ChatModel>((json) => ChatModel.fromJson(json)).toList();
}


Future<List<ChatModel>> fetchChats(http.Client client,String key) async {
  final response = await client.get(base_url + '/get_active_chats',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key
    },);
  return compute(parseChats, response.body);
}

