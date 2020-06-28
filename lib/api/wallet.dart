import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:repay/utils/constants.dart';

Future<String> depositMpesa(key, amount, phone_number) async{
  var response = await http.post(base_url+'/deposit_money',
    headers:<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'key':key
    },
    body: jsonEncode(<String,String>{
      "amount":amount,
      "gateway":"mpesa",
      "phone_number":phone_number,
    })
  );
  var response_body = response.body;
  return response_body;
}

Future<String> send_pesa(key, amount, phone_number, pin) async{
  var response = await http.post(base_url+'/send_money',
      headers:<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'key':key
      },
      body: jsonEncode(<String,String>{
        "amount":amount,
        "receiver_phone_number":phone_number,
        "transaction_type":"4125",
        "pin":pin

      })
  );
  var response_body = response.body;
  var json_encode = json.decode(response_body);
  print(json_encode);
  return json_encode['code'];
}

