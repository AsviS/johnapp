import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:repay/api/messaging/user_chats.dart';
import 'package:repay/utils/constants.dart';
class Users{
  final String username;
  final String profile_image;
  final String country;
  final String phone_number;

  Users({this.username, this.profile_image, this.country, this.phone_number});
  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      username: json['username'],
      profile_image: json['profile_image'],
      country: json['country'],
      phone_number: json['phone_number']
    );
  }
}

List<Users> parseUsers(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Users>((json)=> Users.fromJson(json)).toList();
}

Future<List<Users>> fetchUsers(http.Client client, String key) async {
  final response = await client.get(base_url + '/users',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key,
    },);
  print(response.body.toString());
  return compute(parseUsers, response.body);
}