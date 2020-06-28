import 'package:flutter/cupertino.dart';

class CardModel{
  final String first_name;
  final String second_name;
  final String email;
  final String card_number;
  final String card_holder;
  final String expiry_date;
  final String cvv;
  final String type;
  final String color;

  CardModel({@required this.first_name,@required this.second_name,@required this.email,@required this.card_holder,@required this.card_number,@required this.expiry_date,@required this.cvv,@required this.type,@required this.color, });
}

List<CardModel> list_cards = [
CardModel(
  first_name: "John",
  second_name: "Kinyanjui",
  email: "jakes@gmail.com",
  card_number: "5356272672675262",
  card_holder: "John Kinyanjui",
  expiry_date: "02/03",
  cvv: "789",
  type: "visa",
  color: "blue"),
CardModel(
  first_name: "John",
  second_name: "Kinyanjui",
  email: "jakes@gmail.com",
  card_number: "5356272672675262",
  card_holder: "John Kinyanjui",
  expiry_date: "02/03",
  cvv: "789",
  type: "mastercard",
  color: "blue"),
CardModel(
  first_name: "John",
  second_name: "Kinyanjui",
  email: "jakes@gmail.com",
  card_number: "5356272672675262",
  card_holder: "John Kinyanjui",
  expiry_date: "02/03",
  cvv: "789",
  type: "visa",
  color: "blue"),
];