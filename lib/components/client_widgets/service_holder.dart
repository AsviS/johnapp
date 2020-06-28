import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repay/components/client_widgets/service_card.dart';

class ServiceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   height: 170,
                   child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Services",style: TextStyle(color:Colors.black, fontSize:25, fontWeight:FontWeight.w600),),
                          SizedBox(height:10),
//                        Expanded(
//                          child: Row(
//                            children: <Widget>[
//                              Expanded(child: ServiceCard(
//                                text: "Pay merchant",
//                                icon: FeatherIcons.creditCard,
//                              )),
//                              SizedBox(width:20),
//                              Expanded(child: ServiceCard(
//                                text: "QR code payment",
//                                icon: FeatherIcons.code,
//                              )),
//                              SizedBox(width:20),
//                              Expanded(child: ServiceCard(
//                                text: "Send money to friend",
//                                icon: FeatherIcons.gift,
//                              )),
//
//                            ],
//                          ),
//                        ),
                          SizedBox(height:20),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Expanded(child: ServiceCard(
                                  icon: FeatherIcons.zap,
                                  text: "Request Cash",
                                )),
                                SizedBox(width:20),
                                Expanded(child: ServiceCard(
                                  icon: FeatherIcons.monitor,
                                  text: "Budget planner",
                                )),
                                SizedBox(width:20),
                                Expanded(child: ServiceCard(
                                  icon: FontAwesomeIcons.mobileAlt,
                                  text: "Advanced Money",
                                )),
                              ],
                            ),
                          )

                        ],
                      ),
                 ),
               );
  }
}