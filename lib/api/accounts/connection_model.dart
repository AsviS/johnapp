import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:repay/utils/constants.dart';

class ConnectionModel{
  final String chat_id;
  final String profile_image;
  final String username;
  final String country;
  final String phone_number;

  ConnectionModel({this.chat_id,this.profile_image, this.username, this.country, this.phone_number});

  factory ConnectionModel.fromJson(Map <String, dynamic> json){
    return ConnectionModel(
      chat_id: json['chat_id'],
      profile_image: json['profile_image'],
      username: json['username'],
      country: json['country'],
      phone_number: json['phone_number']);
  }

}

List<ConnectionModel> parseConnections(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ConnectionModel>((json) => ConnectionModel.fromJson(json)).toList();
}


Future<List<ConnectionModel>> fetchConnections(http.Client client,String key) async {
  final response = await client.get(base_url + '/connections',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key
    },);

  return compute(parseConnections, response.body);
}
