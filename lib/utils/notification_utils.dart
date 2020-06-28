import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constants.dart';

Future<String> read_nofication( key) async{
  var json_body = jsonEncode(<String,String>{
    "id":key,
  });
  var response = await http.post(
      base_url + "/read_notification",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json_body
  );
  String response_body = response.body;
  var json_encode = json.decode(response_body);
  print(json_encode);
  return json_encode['status'];
}


