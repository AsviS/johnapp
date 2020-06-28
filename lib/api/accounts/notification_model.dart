import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:repay/utils/constants.dart';


class NotificationModel{
  final int id;
  final String sender_username;
  final String receiver_username;
  final String sender_type;
  final String receiver_type;
  final String notification_type;
  final String notification_message;
  final String notification_status;
  final String notification_date;

  NotificationModel({this.id,this.sender_username, this.receiver_username, this.sender_type, this.receiver_type, this.notification_type, this.notification_message, this.notification_status,this.notification_date});
  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
      id: json['id'],
      sender_username: json['sender_username'],
      receiver_username: json['receiver_username'],
      sender_type: json['sender_type'],
      receiver_type: json['receiver_type'],
      notification_type: json['notification_type'],
      notification_message: json['notification_message'],
      notification_status: json['notification_status'],
      notification_date: json['notification_date']
    );
  }
}

List<NotificationModel> parseNotifications(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
}

Future<List<NotificationModel>> fetchNotifications(http.Client client,String key) async {

  final response = await client.get(base_url + '/notifications',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'key':key
      },);

  return compute(parseNotifications, response.body);
}



