//
//"transaction_id": "18",
//"username": "ivy ",
//"type": "deposit",
//"deduction": "false",
//"amount": "100",
//"date": "2020-05-27"

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:repay/utils/constants.dart';

class TransactionModel{
  final String transaction_id;
  final String username;
  final String type;
  final String deduction;
  final String amount;
  final String date;

  TransactionModel({this.transaction_id, this.username, this.type, this.deduction, this.amount, this.date});
  factory TransactionModel.fromJson(Map<String,  dynamic> json){
    return TransactionModel(
      transaction_id: json['transaction_id'],
      username: json['username'],
      type: json['type'],
      deduction: json['deduction'],
      amount: json['amount'],
      date: json['date']
    );
  }
}


List<TransactionModel> parseTransactions(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<TransactionModel>((json) => TransactionModel.fromJson(json)).toList();
}

Future<List<TransactionModel>> fetchTransactions(http.Client client,String key) async {

  final response = await client.get(base_url + '/all_transactions',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'key':key
    },);

  return compute(parseTransactions, response.body);
}
